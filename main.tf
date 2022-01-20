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

output "instance_ip_addr" {
  value = aws_instance.my_server.private_ip
}