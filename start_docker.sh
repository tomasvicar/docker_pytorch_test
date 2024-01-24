#!/bin/bash

CODE_PATH=$(pwd)

DOCKER_IMAGE_TAG="my_custom_pytorch"

CONTAINER_NAME="my_pytorch_container"

# Build the Docker image
docker build -t $DOCKER_IMAGE_TAG .

# Run the Docker container with volume mapping and port forwarding
docker run -it \
  --gpus all \
  --name $CONTAINER_NAME \
  -p 8888:8888 \
  -v $CODE_PATH:/workspace \
  $DOCKER_IMAGE_TAG