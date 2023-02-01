terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

locals {
  aws_region  = "us-east-1"
  queue_name  = "sre-dev"
  dlq_name    = "sre-dev-dlq"
  common_tags = {
    team      = "tech-sre"
    owner     = "tech-tweakers"
    product   = "portal-api"
    env       = "development"
  }
}

provider "aws" {
  region      = local.aws_region
}

module "sqs-queue" {
  source      = "../"
  tags        = local.common_tags
  queue_name  = local.queue_name
  dlq_name    = local.dlq_name
  create_dlq  = true
}
