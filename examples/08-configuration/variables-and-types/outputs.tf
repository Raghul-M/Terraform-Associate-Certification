output "summary" {
  value = var.enabled ? local_file.types_demo[0].content : "disabled"
}
