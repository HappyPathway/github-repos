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

moved {
  from = module.windows_image_pipeline
  to   = module.gov_repo["windows-image-pipeline"]
}

moved {
  from = module.linux_image_pipeline
  to   = module.gov_repo["linux-image-pipeline"]
}

moved {
  from = module.docker_image_pipeline
  to   = module.gov_repo["docker-image-pipeline"]
}

moved {
  from = module.image-pipeline-goss-testing
  to   = module.gov_repo["image-pipeline-goss-testing"]
}

moved {
  from = module.automation-repos
  to   = module.gov_repo["automation-repos"]
}

moved {
  from = module.ghe-runner
  to   = module.gov_repo["ghe-runner"]
}

moved {
  from = module.arnol377-sandbox
  to   = module.gov_repo["arnol377-sandbox"]
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
}

