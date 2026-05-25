terraform {
  backend "s3" {
    region = "us-east-1"
    # bucket & key are passed via -backend-config in CI
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
