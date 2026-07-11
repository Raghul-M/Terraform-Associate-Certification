output "resource_id" {
  value = random_id.suffix.hex
}

output "inventory_path" {
  value = local_file.inventory.filename
}
