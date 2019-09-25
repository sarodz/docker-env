ARG BASE_CONTAINER=ubuntu:bionic-20190612@sha256:9b1702dcfe32c873a770a32cfd306dd7fc1c4fd134adfb783db68defc8894b3c
FROM $BASE_CONTAINER

MAINTAINER Michael Pilosov <consistentbayes@gmail.com>

RUN apt-get -y update && apt-get install -y --no-install-recommends \
         wget \
         ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# HUGO
ENV HUGO_VER=0.53
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VER}/hugo_${HUGO_VER}_Linux-64bit.deb
RUN dpkg -i hugo*.deb
RUN rm hugo*.deb

ARG NB_USER="jovyan"
ARG NB_UID="1000"
RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER

USER $NB_UID

WORKDIR /tmp
