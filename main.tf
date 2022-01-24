terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.73.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "eu-west-2"
}

resource "aws_instance" "web" {
  ami           = "ami-0fdbd8587b1cf431e"
  instance_type = "t2.nano"

  tags = {
    Name = "MyServer"
  }
}
