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

module "eks" {
  source = "./eks"
  vpc_id = module.vpc.output.id
}
