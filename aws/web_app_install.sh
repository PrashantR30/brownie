#!/bin/bash

# Install Nginx from Amazon Linux Extra 
amazon-linux-extras install nginx1.12

# Setup Service
systemctl enable nginx.service

# Start Nginx
systemctl start nginx

# Installing Docker and Docker Composer 
yum install docker
curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -a -G docker ec2-user

# Starting Docker
systemctl enable docker.service
systemctl start docker