ARG DOCKER_NOTEBOOK_IMAGE
FROM $DOCKER_NOTEBOOK_IMAGE

USER root
COPY ./tex_root.sh ./tmp/tex_root.sh
RUN ./tmp/tex_root.sh
RUN rm ./tmp/tex_root.sh
RUN ./tmp/clean_root.sh

USER $NB_UID
RUN ./tmp/clean_user.sh
