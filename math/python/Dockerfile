ARG DOCKER_NOTEBOOK_IMAGE
FROM $DOCKER_NOTEBOOK_IMAGE
ARG JUPYTERHUB_VERSION

# update conda
USER $NB_UID
RUN conda update -n base --yes conda

# Jupyterhub
RUN python3 -m pip install --no-cache jupyterhub==$JUPYTERHUB_VERSION

###### ROOT ENV #######
USER root

COPY ./py_root.sh ./tmp/py_root.sh
RUN ./tmp/py_root.sh && rm ./tmp/py_root.sh
RUN fix-permissions ./tmp

###### USER ENV #######
USER $NB_UID
COPY ./py/parallel3.sh ./tmp/parallel3.sh
COPY ./py/py3_install.sh ./tmp/py3_install.sh
RUN ./tmp/py3_install.sh
RUN rm ./tmp/py3_install.sh
RUN jupyter lab build

# Copy python 2 installation but do not run it.
COPY ./py/py2_install.sh ./tmp/py2_install.sh
COPY ./py/parallel2.sh ./tmp/parallel2.sh

# copy script with extra python packages (optional)
# do not run in order to save space
COPY ./py/extra_python_packages.sh ./tmp/extra_python_packages.sh
COPY ./py/extensions.sh ./tmp/extensions.sh

# Cleanup
USER root
ADD ./clean_root.sh ./tmp/clean_root.sh
RUN ./tmp/clean_root.sh

USER $NB_UID
ADD ./clean_user.sh ./tmp/clean_user.sh
RUN ./tmp/clean_user.sh

# Finalize by making sure user is not root
USER $NB_UID
