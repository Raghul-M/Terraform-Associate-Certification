terraform {
  required_version = ">= 1.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

# count — identical copies, tracked by index [0], [1], [2]
# Removing the middle item can force unexpected replacements.

resource "local_file" "by_count" {
  count    = 3
  filename = "${path.module}/generated/count-${count.index}.txt"
  content  = "instance index ${count.index}\n"
}

# for_each — distinct resources, tracked by key ["dev"], ["prod"]
# Safer when items have unique identities.

variable "envs" {
  type = map(string)
  default = {
    dev  = "t2.micro"
    prod = "t3.medium"
  }
}

resource "local_file" "by_each" {
  for_each = var.envs
  filename = "${path.module}/generated/each-${each.key}.txt"
  content  = "env=${each.key} size=${each.value}\n"
}
