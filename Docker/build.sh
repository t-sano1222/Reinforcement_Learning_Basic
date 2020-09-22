#!/bin/bash
set -e
set -x
IMAGE_NAME="rl_basic"
IMAGE_TAG="v0.1.0"
cd ..
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} -f Docker/Dockerfile .