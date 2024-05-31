terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  /**
    A backend defines where Terraform stores its state data files.
    Terraform uses persisted state data to keep track of the resources it manages.
    Most non-trivial Terraform configurations either integrate with HCP Terraform
    or use a backend to store state remotely.

    In this case, S3 and DynamoDB was used for the backend.
    - S3 to store terraform state.
    - DynamoDB to manage terraform locking

  **/
  backend "s3" {
    bucket         = "devops-recipe-app-tf-state-atunje"
    key            = "tf-state-setup"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "devops-recipe-app-api-tf-lock"
  }
}

# Add more configuration to the "aws" provider
provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/setup"
    }
  }
}