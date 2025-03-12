#!/bin/bash

# Variables
CONTAINER_NAME="your_container"
IMAGE_NAME="your_dockerhub_username/your_repository"
TAG="latest" # Change if needed

# Stop the container
echo "Stopping container: $CONTAINER_NAME..."
docker stop "$CONTAINER_NAME"

# Commit the container to an image
echo "Creating a new image from container: $CONTAINER_NAME..."
docker commit "$CONTAINER_NAME" "$IMAGE_NAME:$TAG"

# Start the container again (optional)
echo "Restarting container: $CONTAINER_NAME..."
docker start "$CONTAINER_NAME"

# Push the image to Docker Hub
echo "Pushing image $IMAGE_NAME:$TAG to Docker Hub..."
docker push "$IMAGE_NAME:$TAG"

# Remove the local image (optional)
echo "Cleaning up local image: $IMAGE_NAME:$TAG..."
docker rmi "$IMAGE_NAME:$TAG"

echo "Backup and push completed!"


# for backup A container
# Author : NavidSheibani