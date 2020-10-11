#!/bin/bash
set -e
set -x
IMAGE_NAME="zaku.sys.es.osaka-u.ac.jp:10081/t.sano/rl_study"
IMAGE_TAG="v0.2.0" # original-env with kubeflow
cd ..
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} -f Docker/Dockerfile .