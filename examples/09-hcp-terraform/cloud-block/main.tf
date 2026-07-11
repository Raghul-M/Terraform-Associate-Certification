# HCP Terraform / Terraform Cloud style remote operations.
# Replace org and workspace names before using for real.
#
# This file is for studying the syntax. Leave cloud{} commented
# unless you have an HCP Terraform organization.

terraform {
  required_version = ">= 1.0"

  # Uncomment to use HCP Terraform remote runs + remote state:
  #
  # cloud {
  #   organization = "YOUR_ORG"
  #   workspaces {
  #     name = "terraform-mastery-demo"
  #   }
  # }

  # Older equivalent style (remote backend):
  #
  # backend "remote" {
  #   hostname     = "app.terraform.io"
  #   organization = "YOUR_ORG"
  #   workspaces {
  #     name = "terraform-mastery-demo"
  #   }
  # }

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "hcp_study" {
  filename = "${path.module}/generated/hcp-study.txt"
  content  = "Study HCP Terraform: remote state, VCS runs, private registry\n"
}

output "study_file" {
  value = local_file.hcp_study.filename
}
