resource "tfe_variable" "aws_access_key_iam_demo" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key
  category     = "env"
  workspace_id = tfe_workspace.iam_demo.id
  sensitive    = true
}

resource "tfe_variable" "aws_secret_access_iam_demo" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_id
  category     = "env"
  workspace_id = tfe_workspace.iam_demo.id
  sensitive    = true
}

resource "tfe_variable" "aws_access_key_s3_demo" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key
  category     = "env"
  workspace_id = tfe_workspace.s3_demo.id
  sensitive    = true
}

resource "tfe_variable" "aws_secret_access_s3_demo" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_id
  category     = "env"
  workspace_id = tfe_workspace.s3_demo.id
  sensitive    = true
}

resource "tfe_variable" "aws_access_key_vpc_demo" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key
  category     = "env"
  workspace_id = tfe_workspace.vpc_demo.id
  sensitive    = true
}

resource "tfe_variable" "aws_secret_access_vpc_demo" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_id
  category     = "env"
  workspace_id = tfe_workspace.vpc_demo.id
  sensitive    = true
}

// resource "tfe_variable" "aws_access_key_eip_demo" {
//   key          = "AWS_ACCESS_KEY_ID"
//   value        = var.aws_access_key
//   category     = "env"
//   workspace_id = tfe_workspace.eip_demo.id
//   sensitive    = true
// }

// resource "tfe_variable" "aws_secret_access_eip_demo" {
//   key          = "AWS_SECRET_ACCESS_KEY"
//   value        = var.aws_secret_id
//   category     = "env"
//   workspace_id = tfe_workspace.eip_demo.id
//   sensitive    = true
// }