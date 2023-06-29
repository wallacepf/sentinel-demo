terraform {
  cloud {
    organization = "my-demo-account"
    
  }

}

provider "tfe" {}

locals {
  env = var.branch == "main" ? "prod" : "dev"
}