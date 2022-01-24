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

data "aws_availability_zones" "available" {
  state = "available"
}

// module "vpc" {
//   source = "terraform-aws-modules/vpc/aws"

//   name = "my-vpc"
//   cidr = "10.0.0.0/16"

//   azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
//   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
//   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

//   enable_nat_gateway = true

//   tags = {
//     Name = "Demo"
//   }
// }

// module "security_group" {
//   source = "terraform-aws-modules/security-group/aws"

//   name   = "my-sg"
//   vpc_id = module.vpc.vpc_id

//   ingress_cidr_blocks = ["0.0.0.0/0"]
//   ingress_rules       = ["http-80-tcp", "all-icmp"]
//   egress_rules        = ["all-all"]
// }



resource "aws_vpc" "demo" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "demo" {
  vpc_id            = aws_vpc.demo.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = "10.0.1.0/24"

  tags = {
    Owner = "Demo"
    Purpose = "Lab"
  }
}

resource "aws_instance" "demo_server" {
  ami               = "ami-02e136e904f3da870"
  instance_type     = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[0]
  subnet_id         = aws_subnet.demo.id

  tags = {
    Owner = "Demo"
    Purpose = "Lab"
  }
}