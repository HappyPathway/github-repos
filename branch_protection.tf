locals {
  # Only enable branch protection for public repositories or if GitHub Pro is enabled
  enable_branch_protection = {
    for repo in var.repos :
    repo.name => repo.enforce_prs == true && repo.private == false
  }
}
