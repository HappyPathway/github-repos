
module "windows_image_pipeline" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = true
  repo_org          = "HappyPathway"
  name              = "windows-image-pipeline"
  enforce_prs       = false
}

module "linux_image_pipeline" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = true
  repo_org          = "HappyPathway"
  name              = "linux-image-pipeline"
  enforce_prs       = false
}

module "docker_image_pipeline" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = true
  repo_org          = "HappyPathway"
  name              = "docker-image-pipeline"
  enforce_prs       = false
}

# image-pipeline-goss-testing
module "image-pipeline-goss-testing" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = true
  repo_org          = "HappyPathway"
  name              = "image-pipeline-goss-testing"
  enforce_prs       = false
}

module "automation-repos" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = true
  repo_org          = "HappyPathway"
  name              = "automation-repos"
  enforce_prs       = false
}

module "ghe-runner" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = true
  repo_org          = "HappyPathway"
  name              = "ghe-runner"
  enforce_prs       = false
}

module "arnol377-sandbox" {
  source            = "app.terraform.io/roknsound/repo/github"
  force_name        = true
  github_is_private = true
  repo_org          = "HappyPathway"
  name              = "arnol377-sandbox"
  enforce_prs       = false
}