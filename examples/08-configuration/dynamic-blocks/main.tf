terraform {
  required_version = ">= 1.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

# Dynamic blocks generate nested blocks from a collection.
# Same pattern as aws_security_group dynamic "ingress" { ... }

variable "ingress_ports" {
  type    = list(number)
  default = [22, 80, 443]
}

variable "egress_ports" {
  type    = list(number)
  default = [443]
}

locals {
  # Simulate SG-style nested blocks as structured data written to a file
  ingress_rules = [
    for port in var.ingress_ports : {
      from_port = port
      to_port   = port
      protocol  = "tcp"
      cidr      = "0.0.0.0/0"
    }
  ]

  egress_rules = [
    for port in var.egress_ports : {
      from_port = port
      to_port   = port
      protocol  = "tcp"
      cidr      = "0.0.0.0/0"
    }
  ]
}

# Illustrative HCL you would use with AWS (do not need AWS to study the syntax):
#
# resource "aws_security_group" "web" {
#   name = "web"
#   dynamic "ingress" {
#     for_each = var.ingress_ports
#     content {
#       from_port   = ingress.value
#       to_port     = ingress.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }
# }

resource "local_file" "sg_rules" {
  filename = "${path.module}/generated/sg-rules.json"
  content  = jsonencode({
    ingress = local.ingress_rules
    egress  = local.egress_rules
  })
}
