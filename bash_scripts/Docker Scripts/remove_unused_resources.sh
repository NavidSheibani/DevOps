#!/bin/bash
echo "Cleaning up unused Docker resources..."
docker system prune -af --volumes
echo "Cleanup complete!"

