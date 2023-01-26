terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
    backend "s3" {
    bucket = "my-s3-bucket-new"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    #dynamodb_table = "tarraform-state-files-table"
  }
  
}

provider "aws" {
  region  = var.aws_region
  profile = "default"
}

