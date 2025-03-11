#!/bin/bash
CONTAINER_NAME="your_container"

if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "$CONTAINER_NAME is running."
else
    echo "$CONTAINER_NAME is not running. Restarting..."
    docker start "$CONTAINER_NAME"
fi

######
#This script checks if a container is running; if not, it restarts it.
#NavidSheibani
#####
