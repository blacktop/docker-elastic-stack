![el-stack-logo](https://raw.githubusercontent.com/blacktop/docker-elastic-stack/master/docs/img/el_stack_logo.png)

Elastic Stack Dockerfile
========================

[![CircleCI](https://circleci.com/gh/blacktop/docker-elastic-stack.png?style=shield)](https://circleci.com/gh/blacktop/docker-elastic-stack) [![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org) [![Docker Stars](https://img.shields.io/docker/stars/blacktop/elastic-stack.svg)](https://hub.docker.com/r/blacktop/elastic-stack/) [![Docker Pulls](https://img.shields.io/docker/pulls/blacktop/elastic-stack.svg)](https://hub.docker.com/r/blacktop/elastic-stack/) [![Docker Image](https://img.shields.io/badge/docker%20image-525MB-blue.svg)](https://hub.docker.com/r/blacktop/elastic-stack/)

This repository contains a **Dockerfile** of the [Elastic Stack](https://www.elastic.co/products).

### Dependencies

-	[alpine:3.6](https://index.docker.io/_/gliderlabs/alpine/)
-	[openjdk8-jre](https://pkgs.alpinelinux.org/package/v3.4/community/x86_64/openjdk8-jre)
-	[Elasticsearch](https://www.elastic.co/products/elasticsearch)
-	[Logstash](https://www.elastic.co/products/logstash)
-	[Kibana](https://www.elastic.co/products/kibana)

### Image Tags

```bash
$ docker images

REPOSITORY                    TAG                 VIRTUAL SIZE
blacktop/elastic-stack        latest              525MB
blacktop/elastic-stack        6.0-alpha           529MB
blacktop/elastic-stack        5.5                 525MB
blacktop/elastic-stack        5.4                 539MB
blacktop/elastic-stack        5.3                 506MB
blacktop/elastic-stack        geoip               558MB
blacktop/elastic-stack        5.2                 537MB
blacktop/elastic-stack        4.6                 450.9MB
blacktop/elastic-stack        3.1                 363.3MB
```

> **NOTE:** tag **geoip** is the same as tag **latest**, but includes the *ingest-geoip* and the *ingest-user-agent* plugins.

### Getting Started

```bash
$ docker run -d --name elstack -p 80:80 -p 9200:9200 blacktop/elastic-stack
```

##### Now Navigate To

-	With [Docker for Mac](https://docs.docker.com/engine/installation/mac/) : `http://localhost`
-	With [docker-machine](https://docs.docker.com/machine/) : `http://$(docker-machine ip)`
-	With [docker-engine](https://docker.github.io/engine/installation/) : `$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' elstack)`

![elk-logo](https://raw.githubusercontent.com/blacktop/docker-elk/master/docs/img/discover.png)

#### You can also use each part of the stack independently

-	[blacktop/elasticsearch](https://github.com/blacktop/docker-elasticsearch-alpine)
-	[blacktop/logstash](https://github.com/blacktop/docker-logstash-alpine)
-	[blacktop/kibana](https://github.com/blacktop/docker-kibana-alpine)

### Documentation

-	[Add some demo data](docs/add-data.md)
-	[Enable SSL](docs/ssl.md)
-	[Change nginx password](docs/change-pass.md)
-	[Build a multi-node Elastic Stack cluster](docs/mutil-node.md)

### Known Issues :warning:

I have noticed when running the new **5.0** version on a **linux** host you need to increase the memory map areas with the following command

```bash
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf
sudo sysctl -w vm.max_map_count=262144
```

### Issues

Find a bug? Want more features? Find something missing in the documentation? Let me know! Please don't hesitate to [file an issue](https://github.com/blacktop/docker-elastic-stack/issues/new)

### Credits

Heavily (if not entirely) influenced by all the elastic official docker images

### Todo

-	[x] Install/Run Elastic Stack
-	[x] Start Daemon and watch folder with supervisord
-	[x] Expose Logstash config folder as well as Nginx sites folder as Volumes
-	[x] Build ES test data docker image
-	[x] Add Nginx entrypoint to pass USER/PASS in as env vars
-	[x] Add SSL (auto-create certs if not found)
-	[x] Add back a 3.0 version of the stack (elk stack)
-	[ ] Integrate with Bro-IDS

### License

MIT Copyright (c) 2014-2017 **blacktop**
