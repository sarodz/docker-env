#!/bin/bash
IMAGE_NAME=math-user:latest
# build and tag image (which appears at top of list since it is most recent)
docker build . && \
docker tag $(docker images -q | head -n 1) $IMAGE_NAME
# load in our docker-related bash functions
source docker_run.sh
drmi
