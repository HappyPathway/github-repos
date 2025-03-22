locals {
  base_imports = [
    for repo in var.repos : {
      name = repo.name
      type = "repo"
    } if repo.import
  ]
  template_imports = [
    for repo in var.template_repos : {
      name = repo.name
      type = "template"
    } if repo.import
  ]
  composite_action_imports = [
    for action in var.composite_actions : {
      name = action.name
      type = "composite"
    } if action.import
  ]
}

# Import standard repositories
import {
  for_each = { for repo in local.base_imports : repo.name => repo }
  to       = module.repo[each.key].github_repository.repo[0]
  id       = each.key
}

# Import template repositories
import {
  for_each = { for repo in local.template_imports : repo.name => repo }
  to       = module.templates[each.key].github_repository.repo[0]
  id       = each.key
}

# Import composite action repositories
import {
  for_each = local.composite_actions_template
  to       = module.composite_actions[each.key].github_repository.repo[0]
  id       = each.key
}

# Import branch protection for standard repositories
import {
  for_each = { 
    for repo in local.base_imports : repo.name => repo
    if lookup(local.enable_branch_protection, repo.name, false)
  }
  to       = module.repo[each.key].github_branch_protection.protection["main"]
  id       = "${var.repo_org}/${each.key}:main"
}

# Import branch protection for template repositories
import {
  for_each = { 
    for repo in local.template_imports : repo.name => repo
    if lookup(local.enable_branch_protection, repo.name, false)
  }
  to       = module.templates[each.key].github_branch_protection.protection["main"]
  id       = "${var.repo_org}/${each.key}:main"
}

# Import branch protection for composite actions
import {
  for_each = {
    for name, config in local.composite_actions_template : name => config
    if lookup(local.enable_branch_protection, name, false)
  }
  to       = module.composite_actions[each.key].github_branch_protection.protection["main"]
  id       = "${var.repo_org}/${each.key}:main"
}