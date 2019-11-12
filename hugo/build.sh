IMAGE_NAME=hugo-image:latest
docker build -t $IMAGE_NAME .
echo "Successfully built and tagged $IMAGE_NAME"
