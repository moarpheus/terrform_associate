terraform {
  cloud {
    organization = "moarpheus-home"
    workspaces {
      name = "terrform_associate"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.72.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}