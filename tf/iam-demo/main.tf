provider "aws" {
  region = "us-east-1"
}

resource "random_pet" "random" {

}

// module "iam_user2" {
//   source  = "terraform-aws-modules/iam/aws//modules/iam-user"
//   version = "4.9.0"

//   name                          = "dummy-${random_pet.random.id}"
//   force_destroy                 = true
//   create_iam_user_login_profile = false
//   create_iam_access_key         = true
// }

// resource "aws_iam_user" "dummer" {
//   name          = "dummer-${random_pet.random.id}"
//   force_destroy = true
// }

resource "null_resource" "teste" {

}