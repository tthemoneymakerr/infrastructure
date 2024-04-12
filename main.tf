terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "vpc" {
  source = "./vpc"
}

data "aws_vpc" "main" {
  id = module.vpc.output.vpc_id
}

module "eks" {
  source = "./eks"
  vpc_id = data.aws_vpc.id
}
