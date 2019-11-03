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

notebook_image_pro:
	docker build -t $(IMAGE_NAME)-pro:latest \
		--build-arg DOCKER_NOTEBOOK_IMAGE=$(IMAGE_NAME) \
		--build-arg INCL_PARALLEL=$(INCL_PARALLEL) \
		extras

notebook_image_entry:
	docker build --no-cache -t $(IMAGE_NAME)-entry:latest \
		--build-arg DOCKER_NOTEBOOK_IMAGE=$(IMAGE_NAME) \
		entry

notebook_image_pro_entry:
	docker build --no-cache -t $(IMAGE_NAME)-pro-entry:latest \
		--build-arg DOCKER_NOTEBOOK_IMAGE=$(IMAGE_NAME)-pro \
		entry

notebook_image_pro_entry_tex:
	docker build -t $(IMAGE_NAME)-pro-entry-tex:latest \
		--build-arg DOCKER_NOTEBOOK_IMAGE=$(IMAGE_NAME)-pro-entry \
		tex

.PHONY: notebook_image
