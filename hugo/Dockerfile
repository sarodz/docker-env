FROM alpine:latest

LABEL maintainer="Michael Pilosov <consistentbayes@gmail.com>"

# HUGO
ENV HUGO_VERSION 0.53
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit

# Install pygments (for syntax highlighting) and bash
RUN apk update && apk --no-cache add \
    py-pygments \
    bash \
    && rm -rf /var/cache/apk/*

# Download and Install hugo
RUN mkdir /usr/local/hugo
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /usr/local/hugo/
RUN tar xzf /usr/local/hugo/${HUGO_BINARY}.tar.gz -C /usr/local/hugo/ \
    && ln -s /usr/local/hugo/hugo /usr/local/bin/hugo \
    && rm /usr/local/hugo/${HUGO_BINARY}.tar.gz

EXPOSE 1313
CMD hugo version

ARG APP_USER="hugo"
ARG APP_UID="1000"
# Create a group and user
RUN addgroup -S appgroup && \
    adduser --disabled-password \
            -S $APP_USER \
            -G appgroup \
            -s /bin/bash \
            -u $APP_UID \
            -g "Default user" -H

USER ${APP_USER}

WORKDIR /tmp
