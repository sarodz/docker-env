FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y imagemagick
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get autoremove -y
