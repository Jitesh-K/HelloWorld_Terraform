terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.57.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIAXZMCFDTBAD4IXWG6"
  secret_key = "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"
}