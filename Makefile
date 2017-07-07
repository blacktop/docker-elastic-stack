REPO=blacktop
NAME=elastic-stack
BUILD ?= 5.5
LATEST ?= 5.5

all: build size test

build:
	cd $(BUILD); docker build -t $(REPO)/$(NAME):$(BUILD) .

size: build
ifeq "$(BUILD)" "$(LATEST)"
	sed -i.bu 's/docker%20image-.*-blue/docker%20image-$(shell docker images --format "{{.Size}}" $(REPO)/$(NAME):$(BUILD)| cut -d' ' -f1)-blue/' README.md
	sed -i.bu '/latest/ s/[0-9.]\{3,5\}MB/$(shell docker images --format "{{.Size}}" $(REPO)/$(NAME):$(BUILD))/' README.md
endif
	sed -i.bu '/$(BUILD)/ s/[0-9.]\{3,5\}MB/$(shell docker images --format "{{.Size}}" $(REPO)/$(NAME):$(BUILD))/' README.md

tags:
	docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" $(REPO)/$(NAME)

test:
	docker run -d --name "estest$(BUILD)" -p 9200:9200 -e cluster.name=testcluster $(REPO)/$(NAME):$(BUILD); sleep 15;
	docker logs "estest$(BUILD)"
	docker exec "estest$(BUILD)" head -n100 /var/log/elasticsearch.stdout.log
	http localhost:9200 | jq .cluster_name
	docker rm -f "estest$(BUILD)"

run:
	docker run -d --name elstack -p 80:80 -p 9200:9200 $(REPO)/$(NAME):$(BUILD)

.PHONY: build size tags test run
