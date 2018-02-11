# Creates a Web node instance within the Public Subnet

resource "aws_instance" "Web_Node" {
    ami  = "${var.ami}"
    instance_type = "t1.micro"
    key_name = "${aws_key_pair.brownie_key_pair.id}"
    subnet_id = "${aws_subnet.public-subnet.id}"
    vpc_security_group_ids = ["${aws_security_group.web_access.id}"]
    associate_public_ip_address = true
    source_dest_check = false
    tags {
        Name = "WebNode"
    }
}


# Creates a Docker Hosts instance the private subnet
resource "aws_instance" "Docker_Host" {
   ami  = "${var.ami}"
   instance_type = "t1.micro"
   key_name = "${aws_key_pair.brownie_key_pair.id}"
   subnet_id = "${aws_subnet.private-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.docker_access.id}"]
   source_dest_check = false
 
  tags {
    Name = "DockerNode"
  }
}