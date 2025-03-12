#!/bin/bash
read -p "Enter IP to block: " IP
sudo ufw deny from "$IP"
sudo ufw reload
echo "Blocked $IP"

######
#This script blocks an IP address using the Uncomplicated Firewall (UFW).
#NavidSheibani
######
