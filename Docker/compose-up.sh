#!/bin/sh
rm -f .env
touch .env

echo "IMAGE_NAME=rl_basic" >> .env
echo "DOCKERTAG=v0.1.0" >> .env

docker-compose -f docker-compose.yml up