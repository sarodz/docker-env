FROM python:3.8-alpine
LABEL maintainer="Michael Pilosov <consistentbayes@gmail.com>"

ENV PKGS gcc \
         musl-dev \
         openssl-dev \
         libffi-dev

# Install pygments (for syntax highlighting) and bash
RUN apk update && \
    apk --no-cache add \
    ${PKGS} \
    && rm -rf /var/cache/apk/*

RUN pip install -U jrnl

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
CMD ["jrnl"]
