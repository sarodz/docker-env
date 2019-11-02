# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

include .env

.DEFAULT_GOAL=notebook_image

pull:
	docker pull $(DOCKER_NOTEBOOK_IMAGE)

notebook_image:
	docker build -t $(IMAGE_NAME):latest \
		--build-arg JUPYTERHUB_VERSION=$(JUPYTERHUB_VERSION) \
		--build-arg DOCKER_NOTEBOOK_IMAGE=$(DOCKER_NOTEBOOK_IMAGE) \
		.

.PHONY: pull notebook_image
