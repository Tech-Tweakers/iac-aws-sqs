terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  /* backend "s3" {
    bucket = "tech-tweakers-tfstates"
    key    = "first-lab-terraform.tfstate"
    region = "us-east-1"
  } */
}

locals {
  aws_region = "sa-east-1"

  common_tags = {
    team    = "tech-sre"
    owner   = "tech-tweakers"
    product = "portal-api"
    env     = "development"
  }
}

provider "aws" {
  region  = local.aws_region
}

module "sqs-queue" {
  source = "../"
  name                           = "test-sqs-module"
  create_dlq                     = true
  tags                           = local.common_tags
}
