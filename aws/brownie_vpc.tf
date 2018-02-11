variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

# Use AWS a provider with the region defined (i.e eu-west-2)
provider "aws" {
    access_key = "${var.AWS_ACCESS_KEY}"
    secret_key = "${var.AWS_SECRET_KEY}"
    region = "${var.aws_region}"
}

# Define our VPC
resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "BROWNIE_VPC"
    }
}

# Adds a public subnet
resource "aws_subnet" "public-subnet" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.public_subnet_cidr}"
    tags {
        Name = "Public Subnet"
    }
}

# Adds a private subnet
resource "aws_subnet" "private-subnet" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.private_subnet_cidr}"
    tags {
        Name = "Private Subnet"
    }
}

# Creates an Internet Gateway (IGW)
resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.default.id}"
    tags {
        Name = "Brownie_IGW"
    }
}

# Defines a routing table so as to route the public network to the internet
resource "aws_route_table" "public_routing_table" {
    vpc_id = "${aws_vpc.default.id}"
        route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags {
    Name = "Routing Table to Public Subnet from IGW"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "public_routing_table" {
    subnet_id = "${aws_subnet.public-subnet.id}"
    route_table_id = "${aws_route_table.public_routing_table.id}"
}

