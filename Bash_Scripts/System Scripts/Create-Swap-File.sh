#!/bin/bash
echo "Creating a 2GB swap file..."
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab
echo "Swap file created!"


######
#This script adds a 2GB swap file.
#this is for low RAM systems
#NavidSheibani
######
