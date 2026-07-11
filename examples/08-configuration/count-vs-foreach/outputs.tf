output "count_paths" {
  value = [for f in local_file.by_count : f.filename]
}

output "foreach_paths" {
  value = { for k, f in local_file.by_each : k => f.filename }
}
