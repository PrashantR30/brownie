variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

# Use AWS a provider with the region defined (i.e eu-west-2)
provider "aws" {
    access_key = "${var.AWS_ACCESS_KEY}"
    secret_key = "${var.AWS_SECRET_KEY}"
    region = "${var.aws_region}"
}
