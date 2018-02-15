#!/bin/bash

# Creating folders for data persistance
mkdir -p /var/lib/database/brownie/mysqld && chmod -R 775 $_

# Running MySQL Docker
cd ./dockers

# Changing all permissions
find . -name '*.sh' -type f -exec chmod 775 {} \;

# Running MySQL docker compose
docker-compose -f mysql.yml up -d

sleep 10
echo "Please wait... adding user to db"
# Granting privileges
docker exec -it mysql_brownie /usr/bin/mysql -uroot -pBrownie123 -e 'grant all privileges on brownie_wp.* to "brownie_wp"@"%" identified by "brownie001"'

echo "User added to db.. starting all the other dockers"

# Running Wordpress, Prometheus, NodeExporter and CAdvisor
docker-compose up -d