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
  access_key = "<access-key>"
  secret_key = "<secret-key>"
}

resource "aws_instance" "hello-world" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  tags = {
    Name = "ubuntu"
  }
}

resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "vpc"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "vpc-subnet"
  }
}

resource "aws_vpc" "vpc-1" {
  cidr_block       = "10.1.0.0/16"
  tags = {
    Name = "vpc-1"
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.1.1.0/24"
  tags = {
    Name = "vpc-subnet-1"
  }
}
