variable "terraform_workspace" {
  type    = string
  default = "dev"
}

variable "gcs_state_bucket" {
  type    = string
  default = "hpw-terraform-state"
}

variable "gcs_state_key" {
  type    = string
  default = "github-repos"
}

locals {
  plan_config = {
    "env" = {
      "GITHUB_OWNER"       = "$${{ vars.gh_org }}"
      "GITHUB_TOKEN"       = "$${{ secrets.GH_TOKEN }}"
      "GOOGLE_CREDENTIALS" = "$${{ secrets.GOOGLE_CREDENTIALS }}"
      "TF_CLI_ARGS_plan"   = "-var-file=var_files/${var.terraform_workspace}.tfvars"
      "TF_WORKSPACE"       = "${var.terraform_workspace}"
    }
    "jobs" = {
      "terraform" = {
        "name" = "plan"
        "permissions" = {
          "contents"      = "write"
          "pull-requests" = "write"
        }
        "runs-on" = "ubuntu-latest"
        "steps" = [
          {
            "uses" = "actions/checkout@v4"
            "with" = {
              "persist-credentials" = false
              "ref"                 = "$${{ github.head_ref }}"
            }
          },
          {
            "uses" = "actions/setup-node@v3"
            "with" = {
              "node-version" = 16
            }
          },
          {
            "name" = "Setup Terraform"
            "uses" = "hashicorp/setup-terraform@v3.1.2"
            "with" = {
              "terraform_version" = "1.9.1"
            }
          },
          {
            "id"   = "init"
            "name" = "Terraform Init"
            "run"  = "terraform init -backend-config=\"bucket=${var.gcs_state_bucket}\" -backend-config=\"prefix=${var.gcs_state_key}\""
          },
          {
            "id"   = "validate"
            "name" = "Terraform Validate"
            "run"  = "terraform validate"
          },
          {
            "id"   = "plan"
            "name" = "Terraform plan"
            "run"  = "terraform plan"
          },
        ]
      }
    }
    "name" = "${title(var.terraform_workspace)} :: Terraform Plan"
    "true" = {
      "pull_request" = {
        "branches" = [
          "main",
        ]
      }
    }
  }
}

resource "local_file" "plan_config" {
  content  = yamlencode(local.plan_config)
  filename = "terraform-output.yaml"
}
