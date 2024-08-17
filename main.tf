module "repo" {
  source  = "app.terraform.io/roknsound/repo/github"
  force_name = true
  github_is_private = false
  repo_org = "HappyPathway"
  name = "aws-codebuild-image-pipeline"
  enforce_prs = false
}

module "chromebook_venv" {
  source  = "app.terraform.io/roknsound/repo/github"
  force_name = true
  github_is_private = true
  repo_org = "HappyPathway"
  name = "chromebook-venv"
  enforce_prs = false
}

module "windows_image_pipeline" {
  source  = "app.terraform.io/roknsound/repo/github"
  force_name = true
  github_is_private = true
  repo_org = "HappyPathway"
  name = "windows-image-pipeline"
  enforce_prs = false
}

module "linux_image_pipeline" {
  source  = "app.terraform.io/roknsound/repo/github"
  force_name = true
  github_is_private = true
  repo_org = "HappyPathway"
  name = "linux-image-pipeline"
  enforce_prs = false
}

module "docker_image_pipeline" {
  source  = "app.terraform.io/roknsound/repo/github"
  force_name = true
  github_is_private = true
  repo_org = "HappyPathway"
  name = "docker-image-pipeline"
  enforce_prs = false
}


module "terraform-book" {
  source  = "app.terraform.io/roknsound/repo/github"
  force_name = true
  github_is_private = true
  repo_org = "HappyPathway"
  name = "terraform-book"
  enforce_prs = false
}

# image-pipeline-goss-testing
module "image-pipeline-goss-testing" {
  source  = "app.terraform.io/roknsound/repo/github"
  force_name = true
  github_is_private = true
  repo_org = "HappyPathway"
  name = "image-pipeline-goss-testing"
  enforce_prs = false
}

module "automation-repos" {
  source  = "app.terraform.io/roknsound/repo/github"
  force_name = true
  github_is_private = true
  repo_org = "HappyPathway"
  name = "automation-repos"
  enforce_prs = false
}

module "ghe-runner" {
  source  = "app.terraform.io/roknsound/repo/github"
  force_name = true
  github_is_private = true
  repo_org = "HappyPathway"
  name = "ghe-runner"
  enforce_prs = false
}

module "seed-workspace" {
  source  = "app.terraform.io/roknsound/repo/github"
  force_name = true
  github_is_private = false
  repo_org = "HappyPathway"
  name = "seed-workspace"
  enforce_prs = true
}
