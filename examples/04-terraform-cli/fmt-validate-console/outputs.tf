output "greeting" {
  value = var.greeting
}

output "file_path" {
  value = local_file.cli_demo.filename
}
