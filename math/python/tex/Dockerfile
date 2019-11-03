ARG DOCKER_NOTEBOOK_IMAGE
FROM $DOCKER_NOTEBOOK_IMAGE

USER root
COPY ./tex_root.sh ./tmp/tex_root.sh
RUN ./tmp/tex_root.sh && rm ./tmp/tex_root.sh

USER $NB_UID
