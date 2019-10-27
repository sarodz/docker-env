#!/bin/bash
# choose name for your container and image from which it will be built
CONTAINER_NAME=math-user-interactive
IMAGE_NAME=math-user:local
# choose an available port
PORT=8889
# mount files associated with personal settings 
MOUNT_PATH=$HOME
# working directory will be symlinked to /work inside of container
# ram
MEM=3g
# cpu
dri () {
 docker run --name $CONTAINER_NAME --rm -ti \
    -p $PORT:8888 \
    --memory="$MEM" \
    -v $PWD:/home/jovyan/work \
    $IMAGE_NAME start-notebook.sh
}
