#!/bin/bash
. .build.env

build(){
	docker build -t oogy/${IMAGE_NAME}:latest -t oogy/${IMAGE_NAME}:${IMAGE_TAG} . --build-arg GO_VERSION=${GO_VERSION} --build-arg GO_URL=${GO_URL} 
}

push_to_dockerhub(){
	docker push oogy/${IMAGE_NAME}:${IMAGE_TAG}
	docker push oogy/${IMAGE_NAME}:latest
}

main(){
	build
	push_to_dockerhub
}

main

