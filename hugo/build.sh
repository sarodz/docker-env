IMAGE_NAME=hugo-image:latest
docker build . && docker tag $(docker images -q | head -n 1) $IMAGE_NAME
echo "Successfully built and tagged $IMAGE_NAME"
