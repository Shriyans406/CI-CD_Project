#!/bin/bash

echo "==============================="
echo "Starting Docker Build Process"
echo "==============================="

# Create logs directory if not exists
mkdir -p logs

# Build Docker image
sudo docker build -t ci-cd-app -f docker/Dockerfile . > logs/build.log 2>&1

if [ $? -eq 0 ]; then
    echo "Build Successful!"
    echo "Image ci-cd-app created."
else
    echo "Build Failed!"
    echo "Check logs/build.log"
    exit 1
fi
