#!/bin/bash

# update packages
sudo yum update -y

sudo yum install memcached -y


sudo systemctl start memcached
sudo systemctl enable memcached

# check if memcached can run
sudo systemctl status memcached

sudo memcached -p 11211 -U 11111 -u memcached -d

sudo systemctl restart memcached

# Starting the firewall and allowing the port 11211 to access memcache
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo systemctl status firewalld
sudo firewall-cmd --add-port=11211/tcp --permanent
sudo firewall-cmd --reload
