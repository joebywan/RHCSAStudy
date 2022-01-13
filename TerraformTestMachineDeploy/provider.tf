terraform {
  required_version = "1.1.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.7.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}