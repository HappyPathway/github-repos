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
  name = "windows-image-pipeline-packer"
  enforce_prs = false
}

module "linux_image_pipeline" {
  source  = "app.terraform.io/roknsound/repo/github"
  force_name = true
  github_is_private = true
  repo_org = "HappyPathway"
  name = "linux-image-pipeline-packer"
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
