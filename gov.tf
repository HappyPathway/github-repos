locals {
  gov_repos = [
    {
      name        = "windows-image-pipeline"
      org         = "HappyPathway"
      enforce_prs = false
      private     = true
      pull_request_bypassers = [
        "djaboxx"
      ]
    },
    {
      name        = "linux-image-pipeline"
      org         = "HappyPathway"
      enforce_prs = false
      private     = true
      pull_request_bypassers = [
        "djaboxx"
      ]
    },
    {
      name        = "docker-image-pipeline"
      org         = "HappyPathway"
      enforce_prs = false
      private     = true
      pull_request_bypassers = [
        "djaboxx"
      ]
    },
    {
      name        = "image-pipeline-goss-testing"
      org         = "HappyPathway"
      enforce_prs = false
      private     = true
      pull_request_bypassers = [
        "djaboxx"
      ]
    },
    {
      name        = "automation-repos"
      org         = "HappyPathway"
      enforce_prs = false
      private     = true
      pull_request_bypassers = [
        "djaboxx"
      ]
    },
    {
      name        = "ghe-runner"
      org         = "HappyPathway"
      enforce_prs = false
      private     = true
      pull_request_bypassers = [
        "djaboxx"
      ]
    },
    {
      name        = "arnol377-sandbox"
      org         = "HappyPathway"
      enforce_prs = false
      private     = true
      pull_request_bypassers = [
        "djaboxx"
      ]
    }
  ]
}

module "gov_repo" {
  for_each               = tomap({ for repo in local.gov_repos : repo.name => repo })
  source                 = "app.terraform.io/roknsound/repo/github"
  force_name             = true
  github_is_private      = each.value.private
  repo_org               = each.value.org
  name                   = each.value.name
  enforce_prs            = each.value.enforce_prs
  pull_request_bypassers = each.value.pull_request_bypassers
  archive_on_destroy     = false
}

