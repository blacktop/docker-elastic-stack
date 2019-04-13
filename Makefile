REPO=blacktop
NAME=elastic-stack
BUILD ?=$(shell cat LATEST)
LATEST ?=$(shell cat LATEST)

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

test: stop
	docker run -d --name $(NAME) -p 9200:9200 -e cluster.name=testcluster $(REPO)/$(NAME):$(BUILD)
	docker logs $(NAME)
	@wait-for-es
	@docker logs $(NAME)
	docker exec $(NAME) head -n100 /var/log/elasticsearch.stdout.log
	http localhost:9200 | jq .cluster_name
	http localhost
	docker rm -f $(NAME)

.PHONY: log_es
log_es:
	docker exec -it $(NAME) bash -c "tail -f /var/log/elasticsearch.*.log"

.PHONY: log_kb
log_kb:
	docker exec -it $(NAME) tail -f /var/log/kibana*.log

.PHONY: log_ls
log_ls:
	docker exec -it $(NAME) tail -f /var/log/logstash*.log

run: stop
	docker run -d --name $(NAME) -p 80:80 -p 9200:9200 $(REPO)/$(NAME):$(BUILD)

.PHONY: stop
stop:
	docker rm -f $(NAME) || true

.PHONY: build size tags test run
