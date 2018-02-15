#!/bin/bash

# Update packages
yum update -y 

# Install Nginx webserver
yum install -y nginx

# Setup Service
chkconfig nginx on

# Start Nginx
service nginx start
