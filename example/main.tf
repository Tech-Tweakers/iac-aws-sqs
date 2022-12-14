terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
<<<<<<< HEAD
  /* backend "s3" {
    bucket = "tech-tweakers-tfstates"
    key    = "first-lab-terraform.tfstate"
    region = "us-east-1"
  } */
=======
>>>>>>> 132b83d (fix: queues name var)
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
<<<<<<< HEAD
  name                           = "test-sqs-module"
=======

  queue_name = "test-123123"
  dlq_name = "test-123123"

>>>>>>> 132b83d (fix: queues name var)
  create_dlq                     = true
  tags                           = local.common_tags
}
