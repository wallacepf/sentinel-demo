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
    branch             = "add-mono-policy"
    ingress_submodules = false
    oauth_token_id     = var.vcs_oauth_key
  }
}

// data "local_file" "block-iam" {
//   filename = "block-iam-account-creation.sentinel"
// }

// resource "tfe_sentinel_policy" "block-iam" {
//   name         = "block-iam"
//   description  = "Policy to block IAM Account Creation"
//   organization = var.org
//   policy       = file("../../block-iam-account-creation.sentinel")
//   enforce_mode = "hard-mandatory"
// }