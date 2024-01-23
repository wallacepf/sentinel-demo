data "tfe_project" "sentinel-demo" {
  name         = "sentinel-policies-demo"
  organization = local.org
}


resource "tfe_workspace" "iam_demo" {
  name              = "sentinel-iam-demo-${local.env}"
  organization      = local.org
  tag_names         = ["demo", "iam", "sentinel", local.env]
  auto_apply        = true
  queue_all_runs    = false
  working_directory = "tf/iam-demo"
  project_id        = data.tfe_project.sentinel-demo.id

  vcs_repo {
    identifier     = local.vcs_repo
    branch         = local.branch
    oauth_token_id = var.vcs_oauth_key
  }

  depends_on = [tfe_variable_set.vset-jit]
}

resource "tfe_workspace" "s3_demo" {
  name              = "sentinel-s3-demo-${local.env}"
  organization      = local.org
  auto_apply        = false
  queue_all_runs    = false
  tag_names         = ["demo", "s3", "sentinel", local.env]
  working_directory = "tf/s3-demo"
  project_id        = data.tfe_project.sentinel-demo.id

  vcs_repo {
    identifier     = local.vcs_repo
    branch         = local.branch
    oauth_token_id = var.vcs_oauth_key
  }

  depends_on = [tfe_variable_set.vset-jit]
}

resource "tfe_workspace" "vpc_demo" {
  name              = "sentinel-vpc-demo-${local.env}"
  organization      = local.org
  auto_apply        = true
  queue_all_runs    = false
  tag_names         = ["demo", "vpc", "sentinel", local.env]
  working_directory = "tf/vpc-demo"
  project_id        = data.tfe_project.sentinel-demo.id

  vcs_repo {
    identifier     = local.vcs_repo
    branch         = local.branch
    oauth_token_id = var.vcs_oauth_key
  }

  depends_on = [tfe_variable_set.vset-jit]
}