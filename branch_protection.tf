locals {
  # Only enable branch protection for public repositories or if GitHub Pro is enabled
  enable_branch_protection = {
    for repo in var.repos :
    repo.name => repo.enforce_prs == true && repo.private == false
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
  is_template            = lookup(each.value, "is_template")
  archive_on_destroy     = true
}

# Similarly update the templates module
module "templates" {
  for_each               = tomap({ for repo in var.template_repos : repo.name => repo })
  source                 = "HappyPathway/repo/github"
  force_name             = each.value.force_name
  github_is_private      = each.value.private
  repo_org               = var.repo_org
  name                   = each.value.name
  enforce_prs            = each.value.private ? false : each.value.enforce_prs
  pull_request_bypassers = var.pull_request_bypassers
  archive_on_destroy     = true
  template_repo          = each.value.template_repo
  template_repo_org      = each.value.template_repo_org
}
