variable "repos" {
  type = list(object({
    force_name  = bool
    private     = bool
    enforce_prs = bool
    name        = string
    is_template = bool
  }))
  default = []
}

variable "pull_request_bypassers" {
  type    = list(string)
  default = []
}

variable "repo_org" {
  type = string
}

variable "github_repo_base_dir" {
  type = string
}

variable "clone_repo" {
  type    = bool
  default = false
}

variable "refresh_repo" {
  type    = bool
  default = false
}
