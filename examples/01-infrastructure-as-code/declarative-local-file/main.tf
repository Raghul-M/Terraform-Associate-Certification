# Declarative IaC: you declare the DESIRED state.
# Terraform figures out create / update / no-op.
# Run apply twice with the same config → second run makes no changes (idempotent).

variable "app_name" {
  type        = string
  description = "Name written into the managed file"
  default     = "terraform-mastery"
}

resource "local_file" "app_config" {
  filename = "${path.module}/generated/app.conf"
  content  = <<-EOT
    # Managed by Terraform — do not edit by hand (causes drift)
    app_name = ${var.app_name}
    managed  = true
  EOT
}
