terraform {
  required_version = ">= 1.0"

  # Default: local backend (state file on disk).
  # Uncomment for remote state + locking (needs a real bucket + DynamoDB table):
  #
  # backend "s3" {
  #   bucket         = "my-terraform-state-bucket"
  #   key            = "examples/07-state/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "terraform-locks"
  #   encrypt        = true
  # }

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}
