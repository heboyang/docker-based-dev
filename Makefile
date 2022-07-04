CONTAINER_NAME=container-based-dev-example
TAG_NAME=$(CONTAINER_NAME):localdev

.PHONY: docker-build
docker-build:
	docker build . -t $(TAG_NAME)
 
.PHONY: docker-dev
docker-dev:
	docker run -d --name $(CONTAINER_NAME) -v ${CURDIR}:/src $(TAG_NAME) tail -f /dev/null
 
.PHONY: docker-stop
docker-stop:
	docker stop $(CONTAINER_NAME)