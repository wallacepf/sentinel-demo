provider "vault" {
  address = "https://vault-cluster.vault.5bbc50e3-a284-4743-877e-ffd388d684f2.aws.hashicorp.cloud:8200"
  token = "s.HEeALONKTVyMj0ckx4IbsUTN.xbY3N"
  skip_child_token = true
}

provider "aws" {
  region = "us-east-1"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}


data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "tf-sentinel-demo"
}

resource "random_pet" "random" {

}

resource "aws_kms_key" "objects" {
  description             = "KMS key is used to encrypt bucket objects"
  deletion_window_in_days = 7
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket        = "my-demo-s3-${random_pet.random.id}"
  acl           = "private"
  force_destroy = true

  versioning = {
    enabled = false
  }

  tags = {
     Owner   = "Dev"
     Puurpose = "Demo"
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = aws_kms_key.objects.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}