terraform {
  cloud {
    organization = "my-demo-account"
    workspaces {
      tags = ["tfc-config"]
    }
  }

}

provider "tfe" {
  token = var.token
}

locals {
  env = var.branch == "main" ? "prod" : "dev"
}

