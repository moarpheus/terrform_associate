terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.72.0"
    }
  }
}

variable "instance_type" {
  type = string
}


provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

locals {
  instance_type = "t3.micro"
}


resource "aws_instance" "my_server" {
  ami = "ami-0fdbd8587b1cf431e"

  instance_type = local.instance_type

  tags = {
    Name = "MyServer"
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

output "instance_ip_addr" {
  value = aws_instance.my_server.private_ip
}