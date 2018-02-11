# Define the security group for WebNode

resource "aws_security_group" "web_access" {
    name = "Web_Node_Security_Group"
    description = "Allow incoming SSH access and access to web, Grafana and Prometeus console"

    # Allow to SSH from the Internet
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks =  ["0.0.0.0/0"]
    }

    # Allow to Wordpress on port 80 from the Internet
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Allow to Grafana on port 3000 from the Internet
    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Allow to Prometheus on port 9090 from the Internet
    ingress {
        from_port = 9090
        to_port = 9090
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
 
    # Allow to ICMP for testing from the Internet
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id="${aws_vpc.default.id}"

    # Tagging the SG
    tags {
        Name = "Web Node Security Group"
    }
}



# Adding Security Group for Docker Node
resource "aws_security_group" "docker_access"{
    name = "Docker_Node_Security_Group"
    description = "Allow traffic from the WebNode Only"

    # Allow to SSH from the WebNode
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.public_subnet_cidr}"]
    }
 
     # Allow to Wordpress on port 80 from the Internet
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["${var.public_subnet_cidr}"]
    }
    
     # Allow to Grafana on port 3000 from the Internet
    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["${var.public_subnet_cidr}"]
    }

     # Allow to Prometheus on port 9090 from the Internet
    ingress {
        from_port = 9090
        to_port = 9090
        protocol = "tcp"
        cidr_blocks = ["${var.public_subnet_cidr}"]
    }
    
    # Allow to ICMP for testing from the WebNode
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["${var.public_subnet_cidr}"]
    }
 
    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "Docker Node Security Group"
    }
}