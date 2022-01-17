terraform {
    cloud {
        organization = "my-demo-account"

        workspaces {
            name = "sentinel-iam-demo"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

module "iam_user2" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "4.9.0"
  
  name = "alfred"
  force_destroy = true 
    create_iam_user_login_profile = false
  create_iam_access_key         = true
}