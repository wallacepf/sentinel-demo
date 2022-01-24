resource "tfe_policy_set" "deny-iam-user-creation" {
  name          = "deny-iam-user-creation"
  description   = "Policy Set to Deny IAM account creation"
  organization  = local.org
  policies_path = "policies/block-iam-account-creation"
  workspace_ids = [tfe_workspace.iam_demo.id]

  vcs_repo {
    identifier         = "wallacepf/sentinel-demo"
    branch             = "main"
    ingress_submodules = false
    oauth_token_id     = var.vcs_oauth_key
  }
}

resource "tfe_policy_set" "s3-compliance" {
  name          = "s3-compliance"
  description   = "Policy Set to guarantee that S3 buckets will be in compliance"
  organization  = local.org
  policies_path = "policies/s3-best-practices"
  workspace_ids = [tfe_workspace.s3_demo.id]

  vcs_repo {
    identifier         = "wallacepf/sentinel-demo"
    branch             = "main"
    ingress_submodules = false
    oauth_token_id     = var.vcs_oauth_key
  }
}

resource "tfe_policy_set" "tag-enforcement" {
  name          = "tag-enforcement"
  description   = "Policy Set to enforce tags"
  organization  = local.org
  policies_path = "policies/tag-enforcement"
  global        = true

  vcs_repo {
    identifier         = "wallacepf/sentinel-demo"
    branch             = "main"
    ingress_submodules = false
    oauth_token_id     = var.vcs_oauth_key
  }
}

resource "tfe_policy_set_parameter" "resources" {
  key           = "resource_types"
  value         = "[\"aws_instance\", \"aws_s3_bucket\"]"
  policy_set_id = tfe_policy_set.tag-enforcement.id
}

resource "tfe_policy_set_parameter" "tags" {
  key           = "mandatory_tags"
  value         = "[\"Owner\", \"Purpose\"]"
  policy_set_id = tfe_policy_set.tag-enforcement.id
}

resource "tfe_policy_set" "vpc_security" {
  name          = "vpc-security"
  description   = "Policy Set to enforce VPC Security"
  organization  = local.org
  policies_path = "policies/vpc-security"
  workspace_ids = [tfe_workspace.sentinel-vpc-demo.id]

  vcs_repo {
    identifier         = "wallacepf/sentinel-demo"
    branch             = "main"
    ingress_submodules = false
    oauth_token_id     = var.vcs_oauth_key
  }
}

resource "tfe_policy_set_parameter" "allowed_subnet" {
  key           = "allowed_subnet"
  value         = "aws_subnet.internal.id"
  policy_set_id = tfe_policy_set.vpc-security.id
}