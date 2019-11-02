ARG DOCKER_NOTEBOOK_IMAGE
FROM $DOCKER_NOTEBOOK_IMAGE
ARG JUPYTERHUB_VERSION

# update conda
USER $NB_UID
RUN conda update -n base --yes conda
# Jupyterhub and memory monitoring
RUN python3 -m pip install --no-cache jupyterhub==$JUPYTERHUB_VERSION

###### R ENV #######
USER root
COPY r_preq.sh ./tmp/r_preq.sh
RUN ./tmp/r_preq.sh

USER $NB_UID
COPY r_install.sh ./tmp/r_install.sh
RUN ./tmp/r_install.sh

# Cleanup
USER root
ADD ../clean_root.sh ./tmp/clean_root.sh
RUN ./tmp/clean_root.sh

USER $NB_UID
ADD ../clean_user.sh ./tmp/clean_user.sh
RUN ./tmp/clean_user.sh

# Finalize by making sure user is not root
USER $NB_UID
