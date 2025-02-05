pull_request_bypassers = [
  "djaboxx"
]
repo_org             = "HappyPathway"
github_repo_base_dir = null
repos = [
  {
    force_name  = true
    private     = false
    name        = "template-dockerhub-container-workspace"
    enforce_prs = false
    is_template = true
  },
  {
    force_name  = true
    private     = true
    name        = "supervisord-managed-runners"
    enforce_prs = false
    is_template = false
  },
  {
    force_name  = true
    private     = false
    name        = "git-auth"
    enforce_prs = false
    is_template = true
  },
  {
    force_name  = true
    private     = false
    name        = "streamdeck-configs"
    enforce_prs = false
    is_template = true
  },
  {
    force_name  = true
    private     = true
    name        = "template-ecr-container-workspace"
    enforce_prs = false
    is_template = true
  },
  {
    force_name  = true
    private     = true
    name        = "template-gcr-container-workspace"
    enforce_prs = false
    is_template = true
  },
  {
    force_name  = true
    private     = true
    name        = "dockerhub-workspaces"
    enforce_prs = false
    is_template = true
  },
  {
    force_name  = true
    private     = true
    name        = "aws-codebuild-image-pipeline"
    enforce_prs = false
    is_template = false
  },
  {
    force_name  = true
    private     = true
    name        = "chromebook-venv"
    enforce_prs = false
    is_template = false
  },
  {
    force_name  = true
    private     = true
    name        = "terraform-book"
    enforce_prs = false
    is_template = false
  },
  {
    force_name  = true
    private     = true
    name        = "seed-workspace"
    enforce_prs = false
    is_template = false
  },
  {
    force_name  = true
    private     = false
    name        = "centralized-actions"
    enforce_prs = true
    is_template = false
  },
  {
    force_name  = true
    private     = false
    name        = "terraform-plan"
    enforce_prs = true
    is_template = false
  },
  {
    force_name  = true
    private     = true
    name        = "vs-code-workspaces"
    enforce_prs = false
    is_template = false
  },
  {
    force_name  = true
    private     = false
    name        = "terraform-apply"
    enforce_prs = true
    is_template = false
  },
  {
    force_name  = true
    private     = false
    name        = "terraform-validate"
    enforce_prs = true
    is_template = false
  },
  {
    force_name  = true
    private     = false
    name        = "tfe-public-tools"
    enforce_prs = true
    is_template = false
  },
  {
    force_name  = true
    private     = false
    name        = "template-ecs-github-runners"
    enforce_prs = true
    is_template = true
  },
  {
    force_name  = true
    private     = true
    enforce_prs = false
    is_template = false
    name        = "brain-dump"
  },
  # django-terraform
  {
    force_name  = true
    private     = false
    name        = "django-terraform"
    enforce_prs = false
    is_template = false
  },
  {w
    force_name  = true
    private     = false
    name        = "terraform-configurator"
    enforce_prs = false
    is_template = false
  },
  {
    force_name  = true
    private     = true
    name        = "ai-iac-experiments"
    enforce_prs = false
    is_template = false
  },
  {
    force_name  = true
    private     = false
    name        = "tfe-tools"
    enforce_prs = true
    is_template = false
  },
  {
    force_name  = true
    private     = false
    name        = "jarvis"
    enforce_prs = false
    is_template = false
  }
]
