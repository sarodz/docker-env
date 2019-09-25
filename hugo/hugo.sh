#!/bin/bash
docker run --rm -p 1111:1111 --name hugo-user-temp -v $(pwd):/tmp --workdir /tmp hugo-image:stable hugo
