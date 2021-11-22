terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

#   backend "s3" {
#     bucket = "terraform.infra"
#     key    = "terraform.tfstate"
#   }

}

provider "aws" {
  region = "us-west-1"
}