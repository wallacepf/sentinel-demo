terraform {
  cloud {
    organization = "my-demo-account"
    workspaces {
      tags = ["tfc-config"]
    }
  }
  required_providers {
    tfe = {
      version = "~> 0.30.0"
    }
  }
}

provider "tfe" {
  token = var.token
}

locals {
  env = var.branch == "main" ? "prod" : "dev"
}

