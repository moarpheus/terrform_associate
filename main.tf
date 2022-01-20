terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.72.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

resource "aws_instance" "app_server" {
  ami           = ""
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}