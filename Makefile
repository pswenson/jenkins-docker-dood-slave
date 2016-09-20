OWNER=pswenson
IMAGE_NAME=jenkins-docker-dood-slave
VERSION=latest


.PHONY: build push run

build:
	docker build . -t ${OWNER}/${IMAGE_NAME}
	docker tag ${OWNER}/${IMAGE_NAME} ${OWNER}/${IMAGE_NAME}:${VERSION}

push:
	docker push ${OWNER}/${IMAGE_NAME}:${VERSION}

shell:
	docker run --privileged -it --entrypoint=/bin/bash -v /var/run/docker.sock:/var/run/docker.sock ${OWNER}/${IMAGE_NAME}:${VERSION}

run:
	docker run --privileged -it  -v /var/run/docker.sock:/var/run/docker.sock -d ${OWNER}/${IMAGE_NAME}:${VERSION}