terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    github = {
      source = "integrations/github"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {
}

provider "github" {
  token = var.github_token
  owner = var.repository_owner
}

provider "random" {
}

provider "template" {
}
