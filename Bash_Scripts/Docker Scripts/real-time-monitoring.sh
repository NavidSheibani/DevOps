#!/bin/bash
CONTAINER_NAME="your_container"

while true; do
    if ! docker ps --filter "name=$CONTAINER_NAME" --filter "status=running" | grep "$CONTAINER_NAME" > /dev/null; then
        echo "Container $CONTAINER_NAME is down! Restarting..."
        docker restart "$CONTAINER_NAME"
        echo "Restarted $CONTAINER_NAME. Showing logs:"
        docker logs -f "$CONTAINER_NAME"
    fi
    sleep 10 # Check every 10 seconds
done


######
# This script ensures a container restarts if it crashes and shows its logs.
# Author : NavidSheibani
######
