module "var" {
  source  = "HappyPathway/var/env"
  env_var = "GITHUB_TOKEN"
}

resource "github_actions_organization_secret" "example_secret" {
  secret_name     = "GH_TOKEN"
  visibility      = "all"
  plaintext_value = module.var.value
}
