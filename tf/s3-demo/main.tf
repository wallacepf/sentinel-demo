terraform {
  cloud {
    organization = "my-demo-account"

    workspaces {
      name = "sentinel-s3-demo"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_kms_key" "objects" {
  description             = "KMS key is used to encrypt bucket objects"
  deletion_window_in_days = 7
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-bucket"
  acl    = "private"
  force_destroy = true

  versioning = {
    enabled = true
  }

  tags = {
    Owner = "Dev"
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


