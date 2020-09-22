#!/bin/bash
set -e
set -x
CONTAINER_NAME="rl-basic"
docker exec -it ${CONTAINER_NAME} /bin/bash