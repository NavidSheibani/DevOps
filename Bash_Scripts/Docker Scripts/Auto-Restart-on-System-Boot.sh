#!/bin/bash
echo "Starting Docker containers on boot..."
docker start $(docker ps -a -q)
echo "All stopped containers started!"

# To automatically start Docker containers on reboot, use this inside rc.local or a systemd service.
# Author : NavidSheibani
