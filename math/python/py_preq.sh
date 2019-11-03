#!/bin/bash

# Parallelism 
if $INCL_PARALLEL; then 
    apt-get update && \
        apt-get install -y --no-install-recommends \
        mpich \
        libmpich-dev
fi
