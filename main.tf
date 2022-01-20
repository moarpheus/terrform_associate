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

resource "aws_instance" "my_server" {
  ami = "ami-0fdbd8587b1cf431e"

  instance_type = "t2.nano"

  tags = {
    Name = "MyServer"
  }
}