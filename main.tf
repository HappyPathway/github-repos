module "repo" {
  source  = "app.terraform.io/roknsound/repo/github"
  force_name = true
  github_is_private = false
  repo_org = "HappyPathway"
  name = "aws-codebuild-image-pipeline"
}