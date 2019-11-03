ARG DOCKER_NOTEBOOK_IMAGE
FROM $DOCKER_NOTEBOOK_IMAGE

USER root
# extras for the power user
COPY ./extras_as_root.sh ./tmp/extras_as_root.sh
RUN ./tmp/extras_as_root.sh && rm ./tmp/extras_as_root.sh

# Optional parallelism
ARG INCL_PARALLEL
ENV INCL_PARALLEL=$INCL_PARALLEL
COPY ./parallel.sh ./tmp/parallel.sh
RUN ./tmp/parallel.sh && rm ./tmp/parallel.sh

USER $NB_UID
RUN ./tmp/extensions.sh
RUN jupyter lab build
