terraform {
    cloud {
        organization = "my-demo-account"

        workspaces {
            name = "policy-set-auto-creation"
        }
    }
}

provider "tfe" {}

resource "tfe_policy_set" "deny-iam-user-creation" {
  name          = "deny-iam-user-creation"
  description   = "Policy Set to Deny IAM account creation"
  organization  = var.org

  vcs_repo {
    identifier         = "wallacepf/sentinel-demo"
    branch             = "v2"
    ingress_submodules = false
    oauth_token_id     = var.vcs_oauth_key
  }
}