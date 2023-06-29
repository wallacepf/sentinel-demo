terraform {
  cloud {
    organization = "my-demo-account"

  }

}

provider "tfe" {}

locals {
  env = var.branch == "main" ? "prod" : "dev"
  org      = "my-demo-account"
  vcs_repo = "wallacepf/sentinel-demo"
  branch   = var.branch
}
