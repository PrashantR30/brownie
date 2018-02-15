#!/bin/bash
mysql -uroot -pBrownie123 -e "grant all privileges on brownie_wp.* to 'brownie_wp'@'%' identified by 'brownie001'"
