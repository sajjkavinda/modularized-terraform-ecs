
resource "aws_dynamodb_table" "tf_state_lock" {
  name         = "tf_state_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  #stream_enabled = true
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  # backend "s3" {
  #   bucket  = "nonp-somsv2-apse1-s3-backend-tfstate"
  #   key     = "scripts/somsv2/terraform.tfstate"
  #   region  = "ap-southeast-1"
  #   profile = "soms"
  #   #dynamodb_table = "tf_state_lock"
  #   encrypt = true
  # }
}

# Configure the AWS Provider
provider "aws" {
  region  = "ap-southeast-1"
  profile = "mit-test"

  default_tags {
    tags = {
      "creator"   = "achinthab-mit"
      "project"   = "soms_v2-nonp"
      "managedby" = "terraform"
    }
  }
}