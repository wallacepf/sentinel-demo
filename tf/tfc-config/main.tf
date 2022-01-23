terraform {
  cloud {
    organization = "my-demo-account"
    workspaces {
      name = "tfc-config"
    }
  }

}



provider "tfe" {
  token = var.token
}

