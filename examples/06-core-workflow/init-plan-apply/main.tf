# Core workflow target: write → init → plan → apply → destroy

variable "workspace_label" {
  type    = string
  default = "core-workflow"
}

resource "local_file" "workflow" {
  filename = "${path.module}/generated/workflow.txt"
  content  = "Workflow demo: ${var.workspace_label}\n"
}
