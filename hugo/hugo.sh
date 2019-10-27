#!/bin/bash
docker run --rm -p 1313:1313 --name hugo-user-temp -v $(pwd):/tmp --workdir /tmp hugo-image:stable hugo
