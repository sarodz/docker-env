#!/bin/sh

image=$1

docker run -v $(pwd)/test_dir:/opt/ml -p 8002:8080 --rm ${image} serve
