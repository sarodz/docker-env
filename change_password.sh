#!/bin/bash
source docker_run.sh
docker exec -ti $CONTAINER_NAME jupyter-notebook password
docker exec -ti $CONTAINER_NAME cat /home/jovyan/.jupyter/jupyter_notebook_config.json > test.txt
# print secret cookie
#docker exec -ti $CONTAINER_NAME cat /home/jovyan/.local/share/jupyter/runtime/notebook_cookie_secret
cat test.txt

NEWPASS=`cat test.txt | grep password | awk '{print $2}' | sed 's|\"| |g' | sed 's| ||g' | sed 's|||g'`
cat docker_run.sh | sed 's/=sha[^;]*/='$NEWPASS'/g' > docker_run_new.sh
#cat docker_run_new.sh
rm test.txt
echo "Stopping container."
docker stop $CONTAINER_NAME
source docker_run_new.sh
echo "Starting new container with changed password."
dr
echo "docker_run_new.sh has been created with the new password."
