data "google_secret_manager_secret_version" "basic" {
  project = "happypathway-1522441039906"
  secret  = "github_token"
}

resource "github_actions_organization_secret" "example_secret" {
  secret_name     = "GH_TOKEN"
  visibility      = "all"
  plaintext_value = data.google_secret_manager_secret_version.basic.secret_data
}
