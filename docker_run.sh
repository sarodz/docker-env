#!/bin/bash
# choose name for your container and image from which it will be built
export CONTAINER_NAME=math-user-local
IMAGE_NAME=math-user:local
# choose an available port
PORT=8888
# mount files associated with personal settings 
MOUNT_PATH=$HOME
# working directory will be symlinked to /work inside of container
HOME_PATH=$HOME
# shared memory
SHM_SIZE=1g
# ram
MEM=3g
# cpu
CPUS=3.0

CWD=$(pwd)
# to disable jupyterlab by default, change line JUPYTER_ENABLE_LAB=no
# (there are a number of notebook-specific extensions unavailable in lab)
dr () {
 docker run --name $CONTAINER_NAME --rm -d \
    -p $PORT:8888 \
    --memory="$MEM" --cpus="$CPUS" --shm-size="$SHM_SIZE" \
    -v $HOME_PATH:/home/jovyan/work \
    -v $CWD/setup/vimrc:/home/jovyan/.vimrc \
    -v $CWD/setup/vim:/home/jovyan/.vim \
    -v $CWD/setup/bash_aliases:/home/jovyan/.bash_aliases \
    -v $CWD/setup/bash_fzf:/home/jovyan/.bash_fzf \
    -v $MOUNT_PATH/docker-git-config:/home/jovyan/.gitconfig \
    -v $MOUNT_PATH/.ssh:/home/jovyan/.ssh \
    -v $(pwd)/setup/jupyterlab_settings:/home/jovyan/.jupyter/lab/user-settings/@jupyterlab \
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
