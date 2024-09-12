locals {
  github_repo_base_dir = var.github_repo_base_dir != null ? var.github_repo_base_dir : pathexpand("~/git")
}

module "repo" {
  for_each               = tomap({ for repo in var.repos : repo.name => repo })
  source                 = "HappyPathway/repo/github"
  force_name             = each.value.force_name
  github_is_private      = each.value.private
  repo_org               = var.repo_org
  name                   = each.value.name
  enforce_prs            = each.value.enforce_prs
  pull_request_bypassers = var.pull_request_bypassers
  is_template            = lookup(each.value, "is_template")
  archive_on_destroy     = true
}

module "templates" {
  for_each               = tomap({ for repo in var.template_repos : repo.name => repo })
  source                 = "HappyPathway/repo/github"
  force_name             = each.value.force_name
  github_is_private      = each.value.private
  repo_org               = var.repo_org
  name                   = each.value.name
  enforce_prs            = each.value.enforce_prs
  pull_request_bypassers = var.pull_request_bypassers
  archive_on_destroy     = true
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
