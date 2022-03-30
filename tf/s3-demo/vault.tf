provider "vault" {
  address = "https://vault-cluster.vault.5bbc50e3-a284-4743-877e-ffd388d684f2.aws.hashicorp.cloud:8200"
  token = "s.HEeALONKTVyMj0ckx4IbsUTN.xbY3N"
}

data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "tf-sentinel-demo"
}