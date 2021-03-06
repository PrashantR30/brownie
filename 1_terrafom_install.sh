#!/bin/bash
## Run the following on an Debian/ Ubuntu to install Terraform
## Please read changelog.md for changes made to this script

# Updating repository and installing the required packages with apt
apt-get update && apt-get -y install jq unzip git ansible

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

