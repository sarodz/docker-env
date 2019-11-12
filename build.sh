#!/bin/bash
# choose name for local image (as opposed to source image that Dockerfile builds from)
IMAGE_TAG=math-user:local
# build and tag image (which appears at top of list since it is most recent)
docker build -t $IMAGE_TAG -f Dockerfile .
# load in our docker-related bash functions
source docker_run.sh
# clean up images without tags
drmi
