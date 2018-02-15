# Creates a Web node instance within the Public Subnet

resource "aws_instance" "Web_Node" {
    ami  = "${var.ami}"
    instance_type = "t1.micro"
    key_name = "${aws_key_pair.brownie_key_pair.id}"
    subnet_id = "${aws_subnet.public-subnet.id}"
    vpc_security_group_ids = ["${aws_security_group.web_access.id}"]
    associate_public_ip_address = true
    user_data = "${file("web_app_install.sh")}"
    
     provisioner "file" {
        source = "conf/nginx.conf"
        destination = "/etc/nginx/default.conf"
    }
    
    connection {
        type     = "ssh"
        user     = "ec2-user"
    }

    provisioner "remote-exec" {
        inline = [
          "service nginx restart",
        ]
    }
    
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
    user_data = "${file("docker_app_install.sh")}"
     provisioner "file" {
        source = "dockers.tar.gz"
        destination = "/tmp"
    }

    connection {
        type = "ssh"
        user = "ec2-user"
    }

    provisioner "remote-exec" {
        inline = [
            "tar -zxvf /tmp/dockers.tar.gz",
            "chmod 775 /tmp/dockers/deploydockers.sh"
            "/tmp/dockers/deploydockers.sh"
        ]
    }

    tags {
        Name = "DockerNode"
    }
}