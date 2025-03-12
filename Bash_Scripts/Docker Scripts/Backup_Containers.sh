#!/bin/bash
# NavidSheibani
# Set Docker Hub username (optional, if pushing images)
DOCKER_HUB_USERNAME="your_dockerhub_username"
BACKUP_DIR="/backup" # Local backup directory

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Get list of running containers
containers=$(docker ps --format "{{.Names}}")

echo "Found containers: $containers"

# Loop through each running container
for container in $containers; do
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    IMAGE_NAME="${DOCKER_HUB_USERNAME}/${container}_backup"
    IMAGE_TAG="${TIMESTAMP}"
    BACKUP_FILE="${BACKUP_DIR}/${container}_${TIMESTAMP}.tar"

    echo "Backing up container: $container"

    # Commit the container to an image
    docker commit "$container" "$IMAGE_NAME:$IMAGE_TAG"

    # Save the image as a tar file (optional)
    docker save -o "$BACKUP_FILE" "$IMAGE_NAME:$IMAGE_TAG"

    # Push to Docker Hub (optional)
    docker push "$IMAGE_NAME:$IMAGE_TAG"

    # Cleanup: Remove the local image (optional)
    docker rmi "$IMAGE_NAME:$IMAGE_TAG"

    echo "Backup complete: $container → $BACKUP_FILE"
done

echo " All containers backed up successfully!"
