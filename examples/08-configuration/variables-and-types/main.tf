terraform {
  required_version = ">= 1.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

# Variable types (exam favorites)
variable "vpc_name" {
  type        = string
  description = "Name tag"
  default     = "my-vpc"
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "enabled" {
  type    = bool
  default = true
}

variable "my_list" {
  type    = list(string)
  default = ["apple", "banana", "cherry"]
}

variable "my_map" {
  type = map(string)
  default = {
    apple  = "red"
    banana = "yellow"
    cherry = "red"
  }
}

resource "local_file" "types_demo" {
  count    = var.enabled ? 1 : 0
  filename = "${path.module}/generated/types.txt"
  content  = <<-EOT
    vpc_name = ${var.vpc_name}
    ssh_port = ${var.ssh_port}
    list_0   = ${var.my_list[0]}
    map_apple = ${var.my_map["apple"]}
  EOT
}
