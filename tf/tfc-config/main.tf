terraform {
  cloud {
    organization = "my-demo-account"
    workspaces {
      name    = "tfc-config"
      project = "demo"
    }
  }
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.66.0"
    }
  }
}

provider "tfe" {
  token = var.token
}

locals {
  env      = var.branch == "main" ? "prod" : "dev"
  org      = "my-demo-account"
  vcs_repo = "wallacepf/sentinel-demo"
  branch   = var.branch
}
