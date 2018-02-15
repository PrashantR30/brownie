# Defines the key pair to be used by the instances

resource "aws_key_pair" "brownie_key_pair" {
    key_name = "brownie_key"
    public_key = "${file("${var.key_path}")}"
}