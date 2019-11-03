#!/bin/bash

if $INCL_PARALLEL; then
# Parallelism 
    apt-get update && \
        apt-get install -y --no-install-recommends \
        mpich \
        libmpich-dev \
        ;
done
