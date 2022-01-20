terraform {
    cloud {
        organization = "my-demo-account"

        workspaces {
            name = "sentinel-vpc-demo"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}
  
  module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = "my-vpc"
    cidr = "10.0.0.0/16"
    
    azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

    enable_nat_gateway = true

    tags = {
        XXX = "yyy"
    }
  }

  module "security_group" {
    source  = "terraform-aws-modules/security-group/aws"

    name        = "my-sg"
    vpc_id      = module.vpc.vpc_id

    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules       = ["http-80-tcp", "all-icmp"]
    egress_rules        = ["all-all"]

}

resource "null_resource" "teste" {
    
}
