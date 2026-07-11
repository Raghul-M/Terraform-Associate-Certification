# Provider-agnostic provisioning: Terraform talks to platforms via providers.
# Same workflow works for AWS, Azure, GCP, Kubernetes, local files, etc.

resource "random_id" "suffix" {
  byte_length = 4
}

resource "local_file" "inventory" {
  filename = "${path.module}/generated/inventory.txt"
  content  = <<-EOT
    # Provisioned via Terraform providers (not tied to one cloud)
    resource_id = ${random_id.suffix.hex}
  EOT
}
