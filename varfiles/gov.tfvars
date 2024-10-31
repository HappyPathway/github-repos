pull_request_bypassers = [
  "djaboxx"
]
repo_org             = "HappyPathway"
github_repo_base_dir = null
repos = [
  {
    enforce_prs = false
    force_name  = true
    is_template = false
    name        = "github-runner-workspace"
    private     = true
  },
  {
    enforce_prs = false
    force_name  = true
    is_template = false
    name        = "github-workspaces"
    private     = true
  },
  {
    enforce_prs = false
    force_name  = true
    is_template = false
    name        = "arnol377-sandbox"
    private     = true
  },
  {
    enforce_prs = false
    force_name  = true
    is_template = false
    name        = "automation-repos"
    private     = true
  },
  {
    enforce_prs = false
    force_name  = true
    is_template = false
    name        = "docker-image-pipeline"
    private     = true
  },
  {
    enforce_prs = false
    force_name  = true
    is_template = false
    name        = "ghe-runner"
    private     = true
  },
  {
    enforce_prs = false
    force_name  = true
    is_template = false
    name        = "image-pipeline-ansible-playbooks"
    private     = true
  },
  {
    enforce_prs = false
    force_name  = true
    is_template = false
    name        = "image-pipeline-goss-testing"
    private     = true
  },
  {
    enforce_prs = false
    force_name  = true
    is_template = false
    name        = "linux-image-pipeline"
    private     = true
  },
  {
    enforce_prs = false
    force_name  = true
    is_template = false
    name        = "windows-image-pipeline"
    private     = true
  },
  {
    enforce_prs = false
    force_name  = true
    is_template = false
    name        = "opensearch"
    private     = true
  }
]

composite_actions = [
  "terraform-validate",
  "terraform-plan",
  "terraform-apply",
  "terraform-init",
  "aws-auth",
  "github-actions",
  "s3-upload",
  "s3-download",
  "gh-uuid"
]

template_repos = [
  {
    force_name        = true
    private           = true
    name              = "csvd-ecs-github-runners"
    enforce_prs       = false
    template_repo     = "template-ecs-github-runners"
    template_repo_org = "HappyPathway"
  }
]
