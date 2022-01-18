terraform {
  cloud {
    organization = "my-demo-account"
    workspaces {
      name = "policy-set-auto-creation"
    }
  }

}

provider "tfe" {
  token = var.token
}

resource "tfe_policy_set" "deny-iam-user-creation" {
  name          = "deny-iam-user-creation"
  description   = "Policy Set to Deny IAM account creation"
  organization  = var.org
  policies_path = "policies/block-iam-account-creation"

  vcs_repo {
    identifier         = "wallacepf/sentinel-demo"
    branch             = "main"
    ingress_submodules = false
    oauth_token_id     = var.vcs_oauth_key
  }
}