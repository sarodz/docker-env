#!/bin/bash
CONTAINER_NAME=math-user
PORT=8888
MOUNT_PATH=$HOME
# image name to run
IMAGE_NAME=math-user:local
SHM_SIZE=6G
dr () {
 docker run --name $CONTAINER_NAME --rm -d \
    -p $PORT:8888 \
    -p 1234:1234 \
    -p 1313:1313 \
    --shm-size $SHM_SIZE \
    -v $MOUNT_PATH:/home/jovyan/work \
    -v $MOUNT_PATH/.vimrc:/home/jovyan/.vimrc \
    -v $MOUNT_PATH/.vim:/home/jovyan/.vim \
    -v $MOUNT_PATH/.bash_aliases:/home/jovyan/.bash_aliases \
    -v $MOUNT_PATH/docker-git-config:/home/jovyan/.gitconfig \
    -v $MOUNT_PATH/.bash_fzf:/home/jovyan/.bash_fzf \
    -v $MOUNT_PATH/.ssh:/home/jovyan/.ssh \
    -v $MOUNT_PATH/.jupyterlab_settings:/home/jovyan/.jupyter/lab/user-settings/@jupyterlab \
    -e JUPYTER_ENABLE_LAB=yes \
    $IMAGE_NAME start-notebook.sh \
    --NotebookApp.password=sha1:e13f9e82c792:c86ec9e5b95b945b502073e1e3c410ccef6ea2e0;
}
# password is hello

drmi () {
    IMAGES=$(docker images | grep "<none>" | awk '{print $3}')
    if [ $(echo $IMAGES | wc -l) -gt 1 ]; then
        docker rmi $IMAGES;
    fi
}
