# Copyright Amazon.com, Inc. or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

provider "aws" {
  region = "eu-central-1"
  assume_role {
    role_arn = "arn:aws:iam::761428468132:role/tf-deployment-role"
    session_name = "terraform-session"
  }
  default_tags {
    tags = {
      managed_by = "terraform"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "050943451589-tfstate-core-accounts"
    key            = "organization-management/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "tfstate-table"
  }

  # required_version = ">= 1.5.2"
  required_providers {
    aws = {
      version = "~> 5.8"
      source  = "hashicorp/aws"
    }
  }
}