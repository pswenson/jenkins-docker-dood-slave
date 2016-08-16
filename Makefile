OWNER=pswenson
VERSION?=latest
IMAGE_NAME=jenkins-docker-dood-slave

.PHONY: build push run

build:
	docker build . -t ${OWNER}/${IMAGE_NAME}
	docker tag ${OWNER}/${IMAGE_NAME} ${OWNER}/${IMAGE_NAME}:${VERSION}

push:
	docker push ${OWNER}/${IMAGE_NAME}:${VERSION}
