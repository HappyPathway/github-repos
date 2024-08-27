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
  pull_request_bypassers = [
    "djaboxx"
  ]
}



module "terraform-plan" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = false
  repo_org          = "HappyPathway"
  name              = "terraform-plan"
  enforce_prs       = true
  pull_request_bypassers = [
    "djaboxx"
  ]
}


module "terraform-apply" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = false
  repo_org          = "HappyPathway"
  name              = "terraform-apply"
  enforce_prs       = true
  pull_request_bypassers = [
    "djaboxx"
  ]
}


module "terraform-validate" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = false
  repo_org          = "HappyPathway"
  name              = "terraform-validate"
  enforce_prs       = true
  pull_request_bypassers = [
    "djaboxx"
  ]
}


module "tfe-public-tools" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = true
  repo_org          = "HappyPathway"
  name              = "tfe-public-tools"
  enforce_prs       = false
  pull_request_bypassers = [
    "djaboxx"
  ]
}
