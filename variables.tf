variable "github_pro_enabled" {
  description = "Set to true if you have GitHub Pro subscription"
  type        = bool
  default     = false
}

variable "repos" {
  description = "List of repositories to create"
  type = list(object({
    name                    = string
    force_name             = bool
    private                = bool
    import                 = optional(bool, false)
    environments = optional(map(object({
      deployment_branch_policy = optional(object({
        protected_branches     = optional(bool, true)
        custom_branch_policies = optional(bool, false)
      }), {})
      reviewers = optional(object({
        teams = optional(list(string), [])
        users = optional(list(string), [])
      }), {})
      wait_timer = optional(number)
      secrets = optional(list(object({
        name  = string
        value = string
      })), [])
      vars = optional(list(object({
        name  = string
        value = string
      })), [])
    })), {})
  }))
  default = []
}

variable "template_repos" {
  description = "List of template repositories to create"
  type = list(object({
    name                    = string
    force_name             = optional(bool, true)
    private                = optional(bool, true)
    template_repo          = string
    template_repo_org      = string
    import                 = optional(bool, false)
    environments = optional(map(object({
      deployment_branch_policy = optional(object({
        protected_branches     = optional(bool, true)
        custom_branch_policies = optional(bool, false)
      }), {})
      reviewers = optional(object({
        teams = optional(list(string), [])
        users = optional(list(string), [])
      }), {})
      wait_timer = optional(number)
      secrets = optional(list(object({
        name  = string
        value = string
      })), [])
      vars = optional(list(object({
        name  = string
        value = string
      })), [])
    })), {})
  }))
  default = []
}

variable "pull_request_bypassers" {
  description = "List of users or teams that can bypass pull request requirements"
  type        = list(string)
  default     = []
}

variable "repo_org" {
  description = "GitHub organization name"
  type        = string
}

variable "github_repo_base_dir" {
  description = "Base directory for cloning repositories"
  type        = string
  default     = null
}

variable "clone_repo" {
  description = "Whether to clone the repository after creation"
  type        = bool
  default     = false
}

variable "refresh_repo" {
  description = "Whether to refresh the repository after creation"
  type        = bool
  default     = false
}

variable "composite_actions" {
  description = "List of composite actions to create"
  type = list(object({
    name = string
    force_name  = optional(bool, false)
    private     = optional(bool, true)
    enforce_prs = optional(bool, true)
    import      = optional(bool, false)
  }))
  default = []
}

variable "reviewer_usernames" {
  description = "List of GitHub usernames that can be used as environment reviewers"
  type        = list(string)
  default     = []
}
