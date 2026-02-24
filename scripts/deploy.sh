#!/bin/bash
set -euo pipefail

LOG_FILE="logs/deploy.log"
CONTAINER_NAME="ci-cd-container"
IMAGE_NAME="ci-cd-app"

mkdir -p logs

echo "===============================" | tee -a "$LOG_FILE"
echo "        DEPLOY STAGE           " | tee -a "$LOG_FILE"
echo "===============================" | tee -a "$LOG_FILE"

# Read version generated during build
if [ ! -f .version ]; then
    echo "ERROR: .version file not found. Run build.sh first." | tee -a "$LOG_FILE"
    exit 1
fi

VERSION=$(cat .version)

echo "Deploying version: $VERSION" | tee -a "$LOG_FILE"

echo "Stopping existing container (if running)..." | tee -a "$LOG_FILE"
docker stop $CONTAINER_NAME 2>/dev/null || true

echo "Removing existing container (if exists)..." | tee -a "$LOG_FILE"
docker rm $CONTAINER_NAME 2>/dev/null || true

echo "Starting new container..." | tee -a "$LOG_FILE"

docker run -d \
  --name $CONTAINER_NAME \
  -p 5000:5000 \
  $IMAGE_NAME:$VERSION \
  2>&1 | tee -a "$LOG_FILE"

echo "Deployment Successful 🚀" | tee -a "$LOG_FILE"
echo "Container running on http://localhost:5000" | tee -a "$LOG_FILE"
