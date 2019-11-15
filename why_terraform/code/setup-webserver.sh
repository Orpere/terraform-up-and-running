#!/usr/bin/env bash

# update repositories 
apt-get update 

# install pht and apache 
sudo apt-get install -y git php apache2

#copy code from repository 
sudo git clone https://github.com/brikis98/php-app.git /var/www/html/app

# Start apache 
sudo service apache2 start

