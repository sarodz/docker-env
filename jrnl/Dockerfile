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
            -h /home/$APP_USER \
            -u $APP_UID \
            -g "Default user" -H \
            && \
            mkdir /home/$APP_USER && \
            chown -R ${APP_USER}:appgroup /home/$APP_USER/ && \
            chown -R ${APP_USER}:appgroup /tmp
USER ${APP_USER}

WORKDIR /home/${APP_USER}
CMD ["jrnl"]
