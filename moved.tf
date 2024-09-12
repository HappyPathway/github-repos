moved {
  from = module.template-dockerhub-container-workspace
  to   = module.repo["template-dockerhub-container-workspace"]
}

moved {
  from = module.template-ecr-container-workspace
  to   = module.repo["template-ecr-container-workspace"]
}

moved {
  from = module.template-gcr-container-workspace
  to   = module.repo["template-gcr-container-workspace"]
}

moved {
  from = module.dockerhub-workspaces
  to   = module.repo["dockerhub-workspaces"]
}

moved {
  from = module.aws-codebuild-image-pipeline
  to   = module.repo["aws-codebuild-image-pipeline"]
}

moved {
  from = module.chromebook_venv
  to   = module.repo["chromebook-venv"]
}

moved {
  from = module.terraform-book
  to   = module.repo["terraform-book"]
}

moved {
  from = module.seed-workspace
  to   = module.repo["seed-workspace"]
}

moved {
  from = module.centralized-actions
  to   = module.repo["centralized-actions"]
}

moved {
  from = module.terraform-plan
  to   = module.repo["terraform-plan"]
}

moved {
  from = module.terraform-apply
  to   = module.repo["terraform-apply"]
}

moved {
  from = module.terraform-validate
  to   = module.repo["terraform-validate"]
}

moved {
  from = module.tfe-public-tools
  to   = module.repo["tfe-public-tools"]
}

moved {
  from = module.template-ecs-github-runners
  to   = module.repo["template-ecs-github-runners"]
}

moved {
  from = module.gov_repo
  to   = module.repo
}
