# terraform {
#   backend "remote" {
#     organization = "roknsound"
#     workspaces {
#       prefix = "github-repos-"
#     }
#   }
# }

terraform {
  backend "gcs" {}
}

