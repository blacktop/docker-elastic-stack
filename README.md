![elk-logo](https://raw.githubusercontent.com/blacktop/docker-elastic-stack/master/docs/el_stack_logo.png)

Elastic Stack Dockerfile
========================

[![CircleCI](https://circleci.com/gh/blacktop/docker-elastic-stack.png?style=shield)](https://circleci.com/gh/blacktop/docker-elastic-stack) [![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org) [![Docker Stars](https://img.shields.io/docker/stars/blacktop/elk.svg)](https://hub.docker.com/r/blacktop/elk/) [![Docker Pulls](https://img.shields.io/docker/pulls/blacktop/elk.svg)](https://hub.docker.com/r/blacktop/elk/) [![Docker Image](https://img.shields.io/badge/docker image-683.3 MB-blue.svg)](https://hub.docker.com/r/blacktop/elk/)

This repository contains a **Dockerfile** of the [Elastic Stack](https://www.elastic.co/products).

### Dependencies

-	[gliderlabs/alpine:3.4](https://index.docker.io/_/gliderlabs/alpine/)
-	[openjdk8-jre](https://pkgs.alpinelinux.org/package/v3.4/community/x86_64/openjdk8-jre)
-	[Elasticsearch](https://www.elastic.co/products/elasticsearch) 5.0.0
-	[Logstash](https://www.elastic.co/products/logstash) 5.0.0
-	[Kibana](https://www.elastic.co/products/kibana) 5.0.0

### Image Tags

```bash
$ docker images

REPOSITORY          TAG                 VIRTUAL SIZE
blacktop/elk        latest              668   MB
blacktop/elk        5.0                 659   MB
blacktop/elk        4.6                 665   MB
blacktop/elk        3                   542   MB
```

### Installation

1.	Install [Docker](https://docs.docker.com)
2.	Download [trusted build](https://hub.docker.com/r/blacktop/elk/) from public [Docker Registry](https://index.docker.io/): `docker pull blacktop/elk`

### Getting Started

```bash
$ docker run -d --name elstack -p 80:80 -p 9200:9200 blacktop/elastic-stack
```

Now navigate to `$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' elk)`

### Documentation

 * [Add test data](docs/add-data.md)
 * [Change nginx password](docs/change-pass.md)

### Issues

Find a bug? Want more features? Find something missing in the documentation? Let me know! Please don't hesitate to [file an issue](https://github.com/blacktop/docker-elastic-stack/issues/new) and I'll get right on it.

### Credits

### Todo

-	[x] Install/Run ELK
-	[x] Start Daemon and watch folder with supervisord
-	[x] Expose Logstash config folder as well as Nginx sites folder as Volumes
-	[ ] Add SSL
-	[ ] Integrate with Bro-IDS

### License

MIT Copyright (c) 2015-2016 **blacktop**
