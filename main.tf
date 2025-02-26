data "github_team" "platform_team" {
  slug = "platform-team"
}

data "github_user" "reviewers" {
  for_each = toset(try(var.reviewer_usernames, []))
  username = each.value
}

locals {
  github_repo_base_dir = var.github_repo_base_dir != null ? var.github_repo_base_dir : pathexpand("~/git")

  # Enable branch protection only for public repos or when GitHub Pro is enabled
  enable_branch_protection = merge(
    { for repo in var.repos :
      repo.name => coalesce(
        try(repo.enforce_prs, null),
        try(repo.environments != null, false),
        true
      ) && (!repo.private || var.github_pro_enabled)
    },
    { for repo in var.template_repos :
      repo.name => coalesce(
        try(repo.enforce_prs, null),
        try(repo.environments != null, false),
        true
      ) && (!repo.private || var.github_pro_enabled)
    }
  )

  # Only use explicitly defined environments
  environments_as_list = { for repo in var.repos :
    repo.name => [
      for env_name, env_config in try(repo.environments, {}) : merge(
        { name = env_name },
        env_config
      )
    ]
  }

  # Composite actions template configuration
  composite_actions_template = { for action in var.composite_actions :
    action.name => {
      name = action.name
      force_name = try(action.force_name, false)
      private = try(action.private, true)
      enforce_prs = try(action.enforce_prs, true) && (!action.private || var.github_pro_enabled)
    }
  }
}

# Update the module configuration
module "repo" {
  for_each               = tomap({ for repo in var.repos : repo.name => repo })
  source                 = "HappyPathway/repo/github"
  force_name             = each.value.force_name
  github_is_private      = each.value.private
  repo_org               = var.repo_org
  name                   = each.value.name
  enforce_prs            = local.enable_branch_protection[each.key]
  pull_request_bypassers = var.pull_request_bypassers
  is_template            = lookup(each.value, "is_template", false)
  archive_on_destroy     = lookup(each.value, "archive_on_destroy", true)
  environments           = local.environments_as_list[each.key]
}

# Similarly update the templates module with same logic
module "templates" {
  for_each               = tomap({ for repo in var.template_repos : repo.name => repo })
  source                 = "HappyPathway/repo/github"
  force_name             = each.value.force_name
  github_is_private      = each.value.private
  repo_org               = var.repo_org
  name                   = each.value.name
  enforce_prs            = local.enable_branch_protection[each.key]
  pull_request_bypassers = var.pull_request_bypassers
  archive_on_destroy     = true
  template_repo          = each.value.template_repo
  template_repo_org      = each.value.template_repo_org
  environments           = try([
    for env_name, env_config in each.value.environments : merge(
      { name = env_name },
      env_config
    )
  ], [])
}

output "composite_actions" {
  value = local.composite_actions_template
}

output "var_composite_actions" {
  value = var.composite_actions
}

module "composite_actions" {
  for_each               = tomap(local.composite_actions_template)
  source                 = "HappyPathway/repo/github"
  force_name             = each.value.force_name
  github_is_private      = each.value.private
  repo_org               = var.repo_org
  name                   = each.value.name
  enforce_prs            = each.value.enforce_prs
  pull_request_bypassers = var.pull_request_bypassers
  archive_on_destroy     = lookup(each.value, "archive_on_destroy", true)
  environments           = try(
    [
      for env_name, env_config in each.value.environments :
      merge({ name = env_name }, env_config)
    ],
    []
  )
}

locals {
  fetched_repos = merge(module.repo, module.templates, module.composite_actions)
}

data "github_repository" "repo" {
  for_each   = tomap({ for repo in var.repos : repo.name => repo })
  full_name  = "${var.repo_org}/${each.key}"
  depends_on = [module.repo]
}

data "github_ref" "ref" {
  for_each   = tomap({ for repo in var.repos : repo.name => repo })
  owner      = var.repo_org
  repository = each.key
  ref        = "heads/${lookup(data.github_repository.repo, each.key).default_branch}"
  depends_on = [module.repo]
}

resource "null_resource" "clone" {
  for_each = var.clone_repo ? tomap({ for repo in var.repos : repo.name => repo }) : tomap({})
  provisioner "local-exec" {
    command     = "stat ${each.key} || git clone ${module.repo[each.key].github_repo.ssh_clone_url} ${each.key}"
    working_dir = local.github_repo_base_dir
  }
}

resource "null_resource" "pull" {
  for_each = var.refresh_repo ? tomap({ for repo in var.repos : repo.name => repo }) : tomap({})
  triggers = {
    last_commit = data.github_ref.ref[each.key].sha
  }
  provisioner "local-exec" {
    command     = "git fetch"
    working_dir = "${local.github_repo_base_dir}/${each.key}"
  }
  provisioner "local-exec" {
    command     = "git checkout ${lookup(data.github_repository.repo, each.key).default_branch}"
    working_dir = "${local.github_repo_base_dir}/${each.key}"
  }
  provisioner "local-exec" {
    command     = "git pull origin ${lookup(data.github_repository.repo, each.key).default_branch}"
    working_dir = "${local.github_repo_base_dir}/${each.key}"
  }
}
