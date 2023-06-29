terraform {
  cloud {
    organization = "my-demo-account"
    workspaces {
      tags = ["tfc-config"]
    }
  }

}

provider "tfe" {}

locals {
  env = var.branch == "main" ? "prod" : "dev"
}