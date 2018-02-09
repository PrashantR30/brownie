#!/bin/bash

## Please read changelog.md for changes made to this scipt
##


## Run the following on an Debian 9 to install the basic tools to deploy the infrastructure

# Setting up variables

apt-get -y install jq unzip git ansible

# Setting terraform url variable
terraform_url=$(curl https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')

# Create and move to directory.
mkdir -p /opt/terraform && cd $_

# Downloading terraform
echo "Downloading $terraform_url."
curl -o terraform.zip $terraform_url

# Decompress and install
unzip terraform.zip

# Display installed packages
echo --------------------------- Packages Installed -------------------------------
git --version
ansible --version
/opt/terraform/terraform -v
