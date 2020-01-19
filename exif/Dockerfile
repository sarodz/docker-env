FROM alpine:latest
LABEL maintainer="Michael Pilosov <consistentbayes@gmail.com>"

ENV PKGS exiftool

# Install pygments (for syntax highlighting) and bash
RUN apk update && \
    apk --no-cache add \
    ${PKGS} \
    && rm -rf /var/cache/apk/*

ARG APP_USER="safeuser"
ARG APP_UID="1000"

# Create a group and user
RUN addgroup -S appgroup && \
    adduser --disabled-password \
            -S $APP_USER \
            -G appgroup \
            -u $APP_UID \
            -g "Default user" -H

USER ${APP_USER}

WORKDIR /tmp
