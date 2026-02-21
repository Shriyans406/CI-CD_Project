#!/bin/bash

echo "==============================="
echo "Starting Deployment Process"
echo "==============================="

# Create logs directory if not exists
mkdir -p logs

CONTAINER_NAME="ci-cd-container"
IMAGE_NAME="ci-cd-app"

# Stop existing container if running
docker stop $CONTAINER_NAME > /dev/null 2>&1

# Remove existing container if exists
docker rm $CONTAINER_NAME > /dev/null 2>&1

# Run new container
docker run -d --name $CONTAINER_NAME -p 5000:5000 $IMAGE_NAME > logs/deploy.log 2>&1

if [ $? -eq 0 ]; then
    echo "Deployment Successful!"
    echo "Container running on port 5000"
else
    echo "Deployment Failed!"
    echo "Check logs/deploy.log"
    exit 1
fi
