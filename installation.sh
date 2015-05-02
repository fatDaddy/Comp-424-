#!/bin/bash
#this script is used to install the tools used for the LAMP stack and its security 

#update
sudo apt-get update

#give the root password when prompted during the mysql-server install
sudo deconf-set-selections <<< 'mysql-server mysql-server/root_password password QWERasdf1234'

#give the root password when prompted again during the mysql-server install
sudo deconf-set-selections <<< 'mysql-server mysql-server/root_password_again password QWERasdf1234'

#install Apache, MYSQL, PHP
sudo apt-get -y install lamp-server^

#configure the Apache server to not give an error on start
echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/fqdn.conf && sudo a2enconf fqdn

#uncomment the following line if you want the info.php to display
#echo "<?php phpinfo();?>" > /var/www/html/info.php

#restart the server to apply changes
sudo service apache2 restart

#make sure that firewall rules are applied when the server boots
sudo apt-get install iptables-persistent
