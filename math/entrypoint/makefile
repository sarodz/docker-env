# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

include .env

.DEFAULT_GOAL=notebook_image

secrets/password:
	@echo "Generating hash key in $@"
	@echo "HASH_SECRET_KEY=$(shell openssl rand -hex 32)" > $@

login:
	@docker run --rm $(IMAGE_NAME) hashauthpw --length $(PASSWORD_LENGTH) $(USERNAME) $(HASH_SECRET_KEY)

pull:
	docker pull $(DOCKER_NOTEBOOK_IMAGE)

notebook_image:
	docker build -t $(IMAGE_NAME):latest \
		--build-arg JUPYTERHUB_VERSION=$(JUPYTERHUB_VERSION) \
		--build-arg DOCKER_NOTEBOOK_IMAGE=$(DOCKER_NOTEBOOK_IMAGE) \
		.

.PHONY: notebook_image
