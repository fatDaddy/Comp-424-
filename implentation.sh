#!/bin/bash
#######IPtables#######
#for IPtables a white listing approach will be used.

#clear existing rules
sudo iptables -F

#allow ssh traffic
sudo iptables -A INPUT -p tcp --dport ssh -j ACCEPT

#allow traffic web server
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

#allow https traffic
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

#drop all other kinds of traffic
sudo iptables -A INPUT -j DROP

#list the rules
sudo iptables -L

#give write permission to file for save
#had to use a to get it to work
#will remove the permission at the end of the script
sudo chmod a+w /etc/iptables/rules.v4

#save the rules
sudo iptables-save > /etc/iptables/rules.v4

#remove write permission
sudo chmod go-w /etc/iptables/rules.v4
