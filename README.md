![el-stack-logo](https://raw.githubusercontent.com/blacktop/docker-elastic-stack/master/docs/el_stack_logo.png)

Elastic Stack Dockerfile
========================

[![CircleCI](https://circleci.com/gh/blacktop/docker-elastic-stack.png?style=shield)](https://circleci.com/gh/blacktop/docker-elastic-stack) [![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org) [![Docker Stars](https://img.shields.io/docker/stars/blacktop/elastic-stack.svg)](https://hub.docker.com/r/blacktop/elastic-stack/) [![Docker Pulls](https://img.shields.io/docker/pulls/blacktop/elastic-stack.svg)](https://hub.docker.com/r/blacktop/elastic-stack/) [![Docker Image](https://img.shields.io/badge/docker image-568.2 MB-blue.svg)](https://hub.docker.com/r/blacktop/elastic-stack/)

This repository contains a **Dockerfile** of the [Elastic Stack](https://www.elastic.co/products).

### Dependencies

-	[gliderlabs/alpine:3.4](https://index.docker.io/_/gliderlabs/alpine/)
-	[openjdk8-jre](https://pkgs.alpinelinux.org/package/v3.4/community/x86_64/openjdk8-jre)
-	[Elasticsearch](https://www.elastic.co/products/elasticsearch)
-	[Logstash](https://www.elastic.co/products/logstash)
-	[Kibana](https://www.elastic.co/products/kibana)
-	[Filebeat](https://www.elastic.co/products/beats/filebeat)
-	[Metricbeat](https://www.elastic.co/products/beats/metricbeat)

### Image Tags

```bash
$ docker images

REPOSITORY                    TAG                 VIRTUAL SIZE
blacktop/elastic-stack        latest              524.3   MB
blacktop/elastic-stack        5.0                 524.3   MB
blacktop/elastic-stack        4.6                 665   MB
blacktop/elastic-stack        3                   542   MB
```

### Getting Started

```bash
$ docker run -d --name elstack -p 80:80 -p 9200:9200 blacktop/elastic-stack
```

For [Docker for Mac](https://docs.docker.com/engine/installation/mac/):

 * Now navigate to `http://localhost`

For [docker-machine](https://docs.docker.com/machine/):

 * Now navigate to `http://$(docker-machine ip)`

For [docker-engine](https://docker.github.io/engine/installation/):

 * Now navigate to `$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' elstack)`

### Documentation

 * [Add test data](docs/add-data.md)
 * [Change nginx password](docs/change-pass.md)

### Issues

Find a bug? Want more features? Find something missing in the documentation? Let me know! Please don't hesitate to [file an issue](https://github.com/blacktop/docker-elastic-stack/issues/new) and I'll get right on it.

### Credits

Heavily (if not entirely) influenced by all the elasitc official docker images

### Todo

-	[x] Install/Run Elastic Stack
-	[x] Start Daemon and watch folder with supervisord
-	[x] Expose Logstash config folder as well as Nginx sites folder as Volumes
- [ ] Build ES test data docker image
- [ ] Add filebeat/metricbeat
- [ ] compile golang [import-dashboard](https://github.com/elastic/beats/tree/master/libbeat/dashboards) on alpine
-	[ ] Add Nginx entrypoint to pass USER/PASS in as env vars and autocreate certs if not found
-	[ ] Add SSL
-	[ ] Integrate with Bro-IDS

### License

MIT Copyright (c) 2015-2016 **blacktop**
