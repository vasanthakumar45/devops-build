#!/bin/bash

IMAGE_NAME="app"
TAG="v1"

SERVER_ADDRESS="172.18.176.1"

ssh user@${SERVER_ADDRESS} "docker stop myapp && docker rm myapp" || true

if ssh user@${SERVER_ADDRESS} "docker pull ${IMAGE_NAME}:${TAG}"; then
    echo "Docker image pull successful."
else
    echo "Error: Failed to pull Docker image."
    exit 1
fi

ssh user@${SERVER_ADDRESS} "docker run -d -p 80:80 --name myapp ${IMAGE_NAME}:${TAG}"
