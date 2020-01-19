
.PHONY: all \
	python pythons \
	autoconvert imagemagick \
	hugo \
	thesis \
	kubectl \
	autotrace \
	jrnl \
	exif


all: hugo autotrace pythons thesis

jrnl: jrnl/Dockerfile
	docker build -t jrnl jrnl/

kubectl:
	docker pull lachlanevenson/k8s-kubectl:v1.17.0

hugo: hugo/Dockerfile
	docker build -t hugo-image:latest --build-arg VER=$(v) hugo/
	docker tag hugo-image:latest hugo-image:$(v)

imagemagick: imagemagick/Dockerfile
	docker build -t imagemagick imagemagick/

autotrace: autotrace/Dockerfile
	docker build -t autotrace autotrace/

pythons:
	docker pull python:3.8-slim
	docker pull python:3.7-slim
	docker pull python:2.7-slim

thesis:
	docker pull mathematicalmichael/python:thesis
	docker pull mathematicalmichael/latex:thesis

exif: exif/Dockerfile
	docker build -t exif exif/
