ARG DOCKER_NOTEBOOK_IMAGE
FROM $DOCKER_NOTEBOOK_IMAGE

USER root

# Use custom startup script
COPY ./docker-entrypoint.sh /srv/docker-entrypoint.sh
ENTRYPOINT ["tini", "--", "/srv/docker-entrypoint.sh"]
CMD ["start-singleuser.sh"]

USER $NB_UID
