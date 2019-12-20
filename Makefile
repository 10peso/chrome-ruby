.PHONY: help test iex shell build clean rebuild release
.NOTPARALLEL: rebuild release

VERSION ?= `cat VERSION`
IMAGE_NAME ?= 10peso/chrome-ruby

## Print out Docker image name and version
help:
	@echo "$(IMAGE_NAME):$(VERSION)"

## Boot to a shell prompt
shell:
	docker run --rm -it $(IMAGE_NAME):$(VERSION) /bin/bash

## Build the Docker image
build:
	docker build --force-rm -t $(IMAGE_NAME):$(VERSION) -t $(IMAGE_NAME):latest .

## Clean up generated images
clean:
	@docker rmi --force $(IMAGE_NAME):$(VERSION) $(IMAGE_NAME):latest

## Rebuild the Docker image
rebuild: clean build

## Rebuild and release the Docker image to Docker Hub
release: build
	docker push $(IMAGE_NAME):$(VERSION)
	docker push $(IMAGE_NAME):latest

