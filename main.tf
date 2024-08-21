module "repo" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = false
  repo_org          = "HappyPathway"
  name              = "aws-codebuild-image-pipeline"
  enforce_prs       = false
}

module "chromebook_venv" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = true
  repo_org          = "HappyPathway"
  name              = "chromebook-venv"
  enforce_prs       = false
}


module "terraform-book" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = true
  repo_org          = "HappyPathway"
  name              = "terraform-book"
  enforce_prs       = false
}


module "seed-workspace" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = true
  repo_org          = "HappyPathway"
  name              = "seed-workspace"
  enforce_prs       = false
}


module "centralized-actions" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = false
  repo_org          = "HappyPathway"
  name              = "centralized-actions"
  enforce_prs       = true
}

