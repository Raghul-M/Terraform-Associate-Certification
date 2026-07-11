variable "greeting" {
  type    = string
  default = "hello"
}

resource "local_file" "cli_demo" {
  filename = "${path.module}/generated/cli-demo.txt"
  content  = "${var.greeting} from terraform cli example\n"
}
