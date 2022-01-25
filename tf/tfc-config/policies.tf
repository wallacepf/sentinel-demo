data "tfe_workspace" "iam_demo" {
  name         = "sentinel-iam-demo-${local.env}"
  organization = local.org
  depends_on = [
    tfe_workspace.iam_demo
  ]
}

data "tfe_workspace" "s3_demo" {
  name         = "sentinel-s3-demo-${local.env}"
  organization = local.org
  depends_on = [
    tfe_workspace.s3_demo
  ]
}

data "tfe_workspace" "vpc_demo" {
  name         = "sentinel-vpc-demo-${local.env}"
  organization = local.org
  depends_on = [
    tfe_workspace.vpc_demo
  ]
}

data "tfe_workspace" "eip_demo" {
  name         = "sentinel-eip-demo-${local.env}"
  organization = local.org
  depends_on = [
    tfe_workspace.eip_demo
  ]
}

data "tfe_workspace_ids" "prod_wks" {
  tag_names    = ["prod"]
  organization = local.org
  depends_on = [
    tfe_workspace.eip_demo,
    tfe_workspace.vpc_demo,
    tfe_workspace.s3_demo,
    tfe_workspace.iam_demo

  ]
}

data "tfe_workspace_ids" "dev_wks" {
  tag_names    = ["dev"]
  organization = local.org
  depends_on = [
    tfe_workspace.eip_demo,
    tfe_workspace.vpc_demo,
    tfe_workspace.s3_demo,
    tfe_workspace.iam_demo

  ]
}

resource "tfe_policy_set" "deny-iam-user-creation" {
  name          = "deny-iam-user-creation-${local.env}"
  description   = "Policy Set to Deny IAM account creation"
  organization  = local.org
  policies_path = "policies/block-iam-account-creation"
  workspace_ids = [data.tfe_workspace.iam_demo.id]

  vcs_repo {
    identifier         = "wallacepf/sentinel-demo"
    branch             = local.branch
    ingress_submodules = false
    oauth_token_id     = var.vcs_oauth_key
  }
}

resource "tfe_policy_set" "s3-compliance" {
  name          = "s3-compliance-${local.env}"
  description   = "Policy Set to guarantee that S3 buckets will be in compliance"
  organization  = local.org
  policies_path = "policies/s3-best-practices"
  workspace_ids = [data.tfe_workspace.s3_demo.id]

  vcs_repo {
    identifier         = "wallacepf/sentinel-demo"
    branch             = local.branch
    ingress_submodules = false
    oauth_token_id     = var.vcs_oauth_key
  }
}

resource "tfe_policy_set" "tag-enforcement" {
  name          = "tag-enforcement-${local.env}"
  description   = "Policy Set to deny tags"
  organization  = local.org
  policies_path = "policies/tag-enforcement"
  workspace_ids = local.env == "prod" ? values(data.tfe_workspace_ids.prod_wks.ids) : values(data.tfe_workspace_ids.dev_wks.ids)

  vcs_repo {
    identifier         = "wallacepf/sentinel-demo"
    branch             = local.branch
    ingress_submodules = false
    oauth_token_id     = var.vcs_oauth_key
  }
}

resource "tfe_policy_set" "deny-eip" {
  name          = "deny-eip-${local.env}"
  description   = "Policy Set to deny EIP creation"
  organization  = local.org
  policies_path = "policies/deny-eip"
  workspace_ids = [data.tfe_workspace.eip_demo.id]

  vcs_repo {
    identifier         = "wallacepf/sentinel-demo"
    branch             = local.branch
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
  name          = "vpc-security-${local.env}"
  description   = "Policy Set to enforce VPC Security"
  organization  = local.org
  policies_path = "policies/vpc-security"
  workspace_ids = [data.tfe_workspace.vpc_demo.id]

  vcs_repo {
    identifier         = "wallacepf/sentinel-demo"
    branch             = local.branch
    ingress_submodules = false
    oauth_token_id     = var.vcs_oauth_key
  }
}

resource "tfe_policy_set_parameter" "allowed_subnet" {
  key           = "allowed_subnet"
  value         = "aws_subnet.internal.id"
  policy_set_id = tfe_policy_set.vpc_security.id
}
