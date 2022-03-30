provider "vault" {}

data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "tf-sentinel-demo"
}