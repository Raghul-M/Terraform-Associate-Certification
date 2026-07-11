output "config_path" {
  description = "Path to the file Terraform manages"
  value       = local_file.app_config.filename
}

output "config_content" {
  description = "Declared content (desired state)"
  value       = local_file.app_config.content
}
