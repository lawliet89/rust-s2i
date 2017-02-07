
IMAGE_NAME = rust-s2i
RUNTIME_IMAGE_NAME=rust-s2i-runtime

build:
	docker build -t $(IMAGE_NAME) .
	docker build -t ${RUNTIME_IMAGE_NAME} runtime

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	docker build -t ${RUNTIME_IMAGE_NAME}-candidate runtime
	IMAGE_NAME=$(IMAGE_NAME)-candidate RUNTIME_IMAGE_NAME=${RUNTIME_IMAGE_NAME}-candidate test/run
