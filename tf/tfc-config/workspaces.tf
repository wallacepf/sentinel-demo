locals {
  org      = "my-demo-account"
  vcs_repo = "wallacepf/sentinel-demo"
  branch   = "main"
}

resource "tfe_workspace" "iam_demo" {
  name              = "sentinel-iam-demo"
  organization      = local.org
  tag_names         = ["demo", "iam", "sentinel"]
  auto_apply        = true
  working_directory = "tf/iam-demo"

  vcs_repo {
    identifier     = local.vcs_repo
    branch         = local.branch
    oauth_token_id = var.vcs_oauth_key
  }
}

resource "tfe_workspace" "s3_demo" {
  name              = "sentinel-s3-demo"
  organization      = local.org
  auto_apply        = true
  tag_names         = ["demo", "s3", "sentinel"]
  working_directory = "tf/s3-demo"

  vcs_repo {
    identifier     = local.vcs_repo
    branch         = local.branch
    oauth_token_id = var.vcs_oauth_key
  }
}

resource "tfe_workspace" "vpc_demo" {
  name              = "sentinel-vpc-demo"
  organization      = local.org
  auto_apply        = true
  tag_names         = ["demo", "vpc", "sentinel"]
  working_directory = "tf/vpc-demo"

  vcs_repo {
    identifier     = local.vcs_repo
    branch         = local.branch
    oauth_token_id = var.vcs_oauth_key
  }
}