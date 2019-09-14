#!/bin/bash
TIMEPATH=America/Denver
CONFIGPATH=$HOME/.docker/appdata/firefox
# If you want the application to have persistent memory
# (settings, history, etc), then set KEEP=TRUE
KEEP=FALSE
PORT=5800
# memory allocation
SHM_SIZE=2g
if $KEEP; then
    # persistent storage, create this directory if does not exist
    if [ ! -d $CONFIGPATH ]; then
        mkdir -p $CONFIGPATH && \
        echo "created /appdata/firefox/ for persistent storage" ;
    fi
    docker run -d --rm \
        --name=firefox \
        -p $PORT:5800 \
        -p 8888:8888 \
        -v $CONFIGPATH:/config:rw \
        -e "TZ=$TIMEPATH" \
        --shm-size $SHM_SIZE \
        jlesage/firefox;
else
    docker run -d --rm \
        --name=firefox \
        -p $PORT:5800 \
        -p 8888:8888 \
        -e "TZ=$TIMEPATH" \
        --shm-size $SHM_SIZE \
        jlesage/firefox;
fi
