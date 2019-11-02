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
COPY r_preq.sh ./tmp/r_preq.sh
RUN ./tmp/r_preq.sh

USER $NB_UID
COPY r_install.sh ./tmp/r_install.sh
RUN ./tmp/r_install.sh

# Install packages in default Python 3 environment
RUN pip install \
  beautifulsoup4==4.4.*

# Install packages in Python 2 environment
#RUN $CONDA_DIR/envs/python2/bin/pip install \
#  beautifulsoup4==4.4.*

# Use custom startup script
USER root
COPY ../docker-entrypoint.sh /srv/docker-entrypoint.sh
ENTRYPOINT ["tini", "--", "/srv/docker-entrypoint.sh"]
CMD ["start-singleuser.sh"]

# Cleanup
USER root
ADD ../clean_root.sh ./tmp/clean_root.sh
RUN ./tmp/clean_root.sh

USER $NB_UID
ADD ../clean_user.sh ./tmp/clean_user.sh
RUN ./tmp/clean_user.sh

# Finalize by making sure user is not root
USER $NB_UID
