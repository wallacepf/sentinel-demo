provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name   = "my-sg-${random_pet.bucket.id}"
  vpc_id = aws_vpc.demo.id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp"]
  egress_rules        = ["all-all"]
}



resource "aws_vpc" "demo" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "internal" {
  vpc_id            = aws_vpc.demo.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = "10.0.1.0/24"

  tags = {
    Owner   = "Demo"
    Purpose = "Lab"
  }
}

resource "aws_subnet" "external" {
  vpc_id            = aws_vpc.demo.id
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block        = "10.0.2.0/24"

  tags = {
    Owner   = "Demo"
    Purpose = "Lab"
  }
}

resource "aws_instance" "demo_server" {
  ami               = "ami-02e136e904f3da870"
  instance_type     = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[0]
  subnet_id         = aws_subnet.internal.id
  security_groups   = [module.security_group.security_group_id]

  tags = {
    Owner   = "Demo"
    Purpose = "Lab"
  }
}