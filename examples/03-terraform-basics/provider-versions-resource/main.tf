# Standard project layout:
#   versions.tf  → terraform + required_providers
#   main.tf      → resources
#   outputs.tf   → outputs
#
# version = "~> 2.5" means allow 2.5.x … 2.x, but NOT 3.0

variable "project_name" {
  type        = string
  description = "Name used in the managed artifact"
  default     = "basics-demo"
}

resource "local_file" "marker" {
  filename = "${path.module}/generated/${var.project_name}.txt"
  content  = "Created by Terraform basics example\n"
}
