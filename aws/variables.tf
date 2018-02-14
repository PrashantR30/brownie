# Defines all Variables to be used in the infrastructure
variable "aws_region" {
    description = "Region for the Setup"
    default = "eu-west-2"
}

variable "ami" {
    description = "Amazon Linux 2 (as per requirements) "
    default = "ami-6d263d09"
}

variable "key_path" {
    description = "SSH Public Key path (generated)"
    default = "/ec2-user/.ssh/id_brownie_rsa.pub"
}
 
variable "vpc_cidr" {
    description = "CIDR for the VPC"
    default = "10.0.0.0/16"
}
 
variable "public_subnet_cidr" {
    description = "CIDR for the public subnet"
    default = "10.0.1.0/24"
}
 
variable "private_subnet_cidr" {
    description = "CIDR for the private subnet"
    default = "10.0.2.0/24"
}
