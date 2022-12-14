terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
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

  queue_name = "test-123"
  dlq_name = "test-123"

  create_dlq                     = true
  tags                           = local.common_tags
}
