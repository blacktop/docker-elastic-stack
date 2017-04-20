REPO=blacktop
NAME=elastic-stack
BUILD ?= 5.3
LATEST ?= 5.3

all: build size test

build:
	cd $(BUILD); docker build -t $(REPO)/$(NAME):$(BUILD) .

size: build
ifeq "$(BUILD)" "$(LATEST)"
	sed -i.bu 's/docker image-.*-blue/docker image-$(shell docker images --format "{{.Size}}" $(REPO)/$(NAME):$(BUILD))-blue/' README.md
	sed -i.bu '/latest/ s/[0-9.]\{3,5\} MB/$(shell docker images --format "{{.Size}}" $(REPO)/$(NAME):$(BUILD))/' README.md
endif
	sed -i.bu '/$(BUILD)/ s/[0-9.]\{3,5\} MB/$(shell docker images --format "{{.Size}}" $(REPO)/$(NAME):$(BUILD))/' README.md

tags:
	docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" $(REPO)/$(NAME)

test:
	docker run -d --name etest -p 9200:9200 -e cluster.name=testcluster $(REPO)/$(NAME):$(BUILD); sleep 10;
	docker logs etest
	docker exec etest head -n100 /var/log/elasticsearch.stdout.log
	http localhost:9200 | jq .cluster_name
	docker rm -f etest

.PHONY: build size tags test
