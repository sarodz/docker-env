ARG DOCKER_NOTEBOOK_IMAGE
FROM $DOCKER_NOTEBOOK_IMAGE
ARG JUPYTERHUB_VERSION

# update conda
USER $NB_UID
RUN conda update -n base --yes conda

# Jupyterhub
RUN python3 -m pip install --no-cache jupyterhub==$JUPYTERHUB_VERSION

###### Python ENV #######
USER root
COPY py_preq.sh ./tmp/py_preq.sh
RUN ./tmp/py_preq.sh

USER $NB_UID
COPY py_install.sh ./tmp/py_install.sh
RUN ./tmp/py_install.sh

# Cleanup
USER root
ADD ../clean_root.sh ./tmp/clean_root.sh
RUN ./tmp/clean_root.sh

USER $NB_UID
ADD ../clean_user.sh ./tmp/clean_user.sh
RUN ./tmp/clean_user.sh

# Finalize by making sure user is not root
USER $NB_UID
