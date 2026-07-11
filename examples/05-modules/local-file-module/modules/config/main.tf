resource "local_file" "config" {
  filename = "${path.root}/generated/${var.app_name}-${var.environment}.conf"
  content  = <<-EOT
    app_name    = ${var.app_name}
    environment = ${var.environment}
  EOT
}
