output "file_path" {
  description = "Path to the generated config file"
  value       = local_file.config.filename
}

output "config_id" {
  description = "Stable id for this config (app + env)"
  value       = "${var.app_name}-${var.environment}"
}
