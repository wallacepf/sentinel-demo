terraform {
  cloud {
    organization = "my-demo-account"
    workspaces {
      tags = [ "tfc-config-prod" ]
    }
  }
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "~> 0.45.0"
    }
  }
}

provider "tfe" {
  token = var.token
}

locals {
  env = var.branch == "main" ? "prod" : "dev"
  org      = "my-demo-account"
  vcs_repo = "wallacepf/sentinel-demo"
  branch   = var.branch
}
