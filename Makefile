REGISTRY_IMAGE=ghcr.io/caprisys/tracee

.PHONY:	all
all: build test

.PHONY:	build
build:
	docker build -t $(REGISTRY_IMAGE) .

.PHONY:	test
test:
	docker run --rm -i $(REGISTRY_IMAGE) --rules TRC-3 --rules TRC-4 --list-events

.PHONY: clean
clean:
	docker image rm $(REGISTRY_IMAGE)
