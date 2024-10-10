provider "aws" {
  region = "us-east-1"
}

resource "random_pet" "random" {

}

resource "aws_kms_key" "objects" {
  description             = "KMS key is used to encrypt bucket objects"
  deletion_window_in_days = 7
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.14.0"

  bucket = "my-demo-s3-teste-${random_pet.random.id}"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"
  force_destroy = true

  versioning = {
    enabled = false
  }

  tags = {
    Owner   = "Dev"
    Purpose = "Demo"
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





