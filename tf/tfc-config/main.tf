terraform {
  cloud {
    organization = "my-demo-account"
    workspaces {
      name = "tfc-config"
    }
  }

}

provider "tfe" {}

locals {
  env = var.branch == "main" ? "prod" : "dev"
}