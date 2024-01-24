#!/bin/bash

CODE_PATH=$(pwd)

DOCKER_IMAGE_TAG="my_custom_pytorch"

DOCKER_IMAGE="pytorch/pytorch:latest"

CONTAINER_NAME="my_pytorch_container"

docker build -t $DOCKER_IMAGE_TAG .

docker run -it \
  --gpus all \
  --name $CONTAINER_NAME \
  -v $CODE_PATH:/workspace \
  $DOCKER_IMAGE_TAG bash
