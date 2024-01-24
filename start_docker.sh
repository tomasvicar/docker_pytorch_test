#!/bin/bash

# Set the path to the current directory
CODE_PATH=$(pwd)

# Define the Docker image you want to use
DOCKER_IMAGE="pytorch/pytorch:latest"

# Define the container name
CONTAINER_NAME="my_pytorch_container"

# Run the Docker container with volume mapping
docker run -it \
  --gpus all \
  --name $CONTAINER_NAME \
  -v $CODE_PATH:/app \
  $DOCKER_IMAGE bash
