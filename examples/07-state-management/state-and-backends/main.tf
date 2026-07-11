resource "local_file" "alpha" {
  filename = "${path.module}/generated/alpha.txt"
  content  = "alpha\n"
}

resource "local_file" "beta" {
  filename = "${path.module}/generated/beta.txt"
  content  = "beta\n"
}
