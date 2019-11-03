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
	docker build --no-cache -t $(IMAGE_NAME):latest \
		--build-arg JUPYTERHUB_VERSION=$(JUPYTERHUB_VERSION) \
		--build-arg DOCKER_NOTEBOOK_IMAGE=$(DOCKER_NOTEBOOK_IMAGE) \
		.

notebook_image_entry:
	docker build --no-cache -t $(IMAGE_NAME)-entry:latest \
		--build-arg DOCKER_NOTEBOOK_IMAGE=$(IMAGE_NAME) \
		entry

# bundle tex in for power users
notebook_image_pro:
	docker build --no-cache -t $(IMAGE_NAME)-pro:latest \
		--build-arg DOCKER_NOTEBOOK_IMAGE=$(IMAGE_NAME)-entry \
		--build-arg INCL_PARALLEL=$(INCL_PARALLEL) \
		extras \
    && \
	docker build -t $(IMAGE_NAME)-pro:latest \
		--build-arg DOCKER_NOTEBOOK_IMAGE=$(IMAGE_NAME)-pro \
		tex

notebook_image_tex:
	docker build --no-cache -t $(IMAGE_NAME)-entry-tex:latest \
		--build-arg DOCKER_NOTEBOOK_IMAGE=$(IMAGE_NAME)-entry \
		--build-arg INCL_PARALLEL=$(INCL_PARALLEL) \
		tex
 
.PHONY: notebook_image
