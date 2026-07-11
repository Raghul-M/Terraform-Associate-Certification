terraform {
  required_version = ">= 1.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

resource "random_password" "db" {
  length  = 16
  special = false
}

resource "local_file" "app" {
  filename = "${path.module}/generated/app.txt"
  content  = "app ready\n"
}

output "app_path" {
  description = "Non-sensitive output"
  value       = local_file.app.filename
}

output "db_password" {
  description = "Sensitive — hidden in CLI by default"
  value       = random_password.db.result
  sensitive   = true
}
