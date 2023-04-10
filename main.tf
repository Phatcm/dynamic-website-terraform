terraform {
  required_version = ">= 1.0.0"
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-1"
  profile = "phatcao-admin"
}
# Store terraform file to s3
terraform {
  backend "s3" {
    bucket = "phatcao-terraform-remote-state"
    key    = "terraform.tfstate.dev"
    region = "ap-northeast-1"
    profile = "phatcao-admin"
  }
}

module "vpc" {
  source = "./modules/vpc"
}


