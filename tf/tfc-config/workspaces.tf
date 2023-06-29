locals {
  org      = "my-demo-account"
  vcs_repo = "wallacepf/sentinel-demo"
  branch   = var.branch
}

resource "tfe_project" "demo-290320237" {
  organization = local.org
  name = "demo-290320237"
}

resource "tfe_workspace" "iam_demo" {
  name              = "sentinel-iam-demo-${local.env}"
  organization      = local.org
  tag_names         = ["demo", "iam", "sentinel", local.env]
  auto_apply        = true
  working_directory = "tf/iam-demo"
  project_id = tfe_project.demo-290320237.id

  vcs_repo {
    identifier     = local.vcs_repo
    branch         = local.branch
    oauth_token_id = var.vcs_oauth_key
  }
}

resource "tfe_workspace" "s3_demo" {
  name              = "sentinel-s3-demo-${local.env}"
  organization      = local.org
  auto_apply        = true
  tag_names         = ["demo", "s3", "sentinel", local.env]
  working_directory = "tf/s3-demo"
  project_id = tfe_project.demo-290320237.id

  vcs_repo {
    identifier     = local.vcs_repo
    branch         = local.branch
    oauth_token_id = var.vcs_oauth_key
  }
}

resource "tfe_workspace" "vpc_demo" {
  name              = "sentinel-vpc-demo-${local.env}"
  organization      = local.org
  auto_apply        = true
  tag_names         = ["demo", "vpc", "sentinel", local.env]
  working_directory = "tf/vpc-demo"
  project_id = tfe_project.demo-290320237.id

  vcs_repo {
    identifier     = local.vcs_repo
    branch         = local.branch
    oauth_token_id = var.vcs_oauth_key
  }
}

// resource "tfe_workspace" "eip_demo" {
//   name              = "sentinel-eip-demo-${local.env}"
//   organization      = local.org
//   auto_apply        = true
//   tag_names         = ["demo", "eip", "sentinel", local.env]
//   working_directory = "tf/eip-demo"

//   vcs_repo {
//     identifier     = local.vcs_repo
//     branch         = local.branch
//     oauth_token_id = var.vcs_oauth_key
//   }
// }