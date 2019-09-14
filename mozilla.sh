#!/bin/bash
TIMEPATH=/var/db/timezone/zoneinfo/America/New_York
CONFIGPATH=$HOME/.docker/appdata/firefox
# If you want the application to have persistent memory
# (settings, history, etc), then set KEEP=TRUE
KEEP=TRUE
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
        -v $CONFIGPATH:/config:rw \
        -v $TIMEPATH:/etc/localtime \
        --shm-size $SHM_SIZE \
        jlesage/firefox;
else
    docker run -d --rm \
        --name=firefox \
        -p $PORT:5800 \
        -v $TIMEPATH:/etc/localtime \
        --shm-size $SHM_SIZE \
        jlesage/firefox;
fi
