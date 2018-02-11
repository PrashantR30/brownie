# Define the security group for public subnet

resource "aws_security_group" "web_access" {
    name = "Web_Node_Security_Group"
    description = "Allow incoming SSH access and access to web, Grafana and Prometeus console"

    # Allow to SSH 
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks =  ["0.0.0.0/0"]
    }

    # Allow to Wordpress on port 80
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Allow to Grafana on port 3000
    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Allow to Prometheus on port 9090
    ingress {
        from_port = 9090
        to_port = 9090
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
 
    # Allow to ICMP for testing
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Tagging the SG
    vpc_id="${aws_vpc.default.id}"
    tags {
        Name = "Web Node Security Group"
    }
}
