#!/bin/bash
set -euo pipefail

LOG_FILE="logs/build.log"
IMAGE_NAME="ci-cd-app"
VERSION=$(date +%Y%m%d%H%M%S)

echo "===============================" | tee -a "$LOG_FILE"
echo "     DOCKER BUILD STAGE        " | tee -a "$LOG_FILE"
echo "===============================" | tee -a "$LOG_FILE"

# Create logs directory
mkdir -p logs

echo "Building Docker image..." | tee -a "$LOG_FILE"

docker build -t $IMAGE_NAME:$VERSION -t $IMAGE_NAME:latest -f docker/Dockerfile . \
  2>&1 | tee -a "$LOG_FILE"

echo "$VERSION" > .version

echo "Build Successful! 🚀" | tee -a "$LOG_FILE"
echo "Created images:" | tee -a "$LOG_FILE"
echo "  - $IMAGE_NAME:$VERSION" | tee -a "$LOG_FILE"
echo "  - $IMAGE_NAME:latest" | tee -a "$LOG_FILE"
