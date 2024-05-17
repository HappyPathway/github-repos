terraform {
    backend "remote" {
        organization = "roknsound"
        workspaces {
          name = "github-repos"
        }
    }
}