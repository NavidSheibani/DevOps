#!/bin/bash
CONTAINER_NAME="your_container"
IMAGE_NAME="your_image"

echo "Restarting $CONTAINER_NAME..."
docker stop "$CONTAINER_NAME" && docker rm "$CONTAINER_NAME"
docker run -d --name "$CONTAINER_NAME" "$IMAGE_NAME"
echo "$CONTAINER_NAME restarted successfully!"

######
# This script stops and removes a container before recreating it.
# Ensures a fresh start without leaving stopped containers behind.
# Author : NavidSheibani
######
