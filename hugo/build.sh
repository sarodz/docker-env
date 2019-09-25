docker build . && docker tag $(docker images -q | head -n 1) hugo-image:stable
echo "Successfully built and tagged hugo-image:stable"
