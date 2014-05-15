ELK Stack Dockerfile
=============

This repository contains a **Dockerfile** of [ELK](http://www.elasticsearch.org/overview/elkdownloads/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/blacktop/elk/) published to the public [Docker Registry](https://index.docker.io/).

### Dependencies

* [ubuntu:latest](https://index.docker.io/_/ubuntu/)


### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/blacktop/elk/) from public [Docker Registry](https://index.docker.io/): `docker pull blacktop/bro`

#### Alternatively, build an image from Dockerfile
```bash
$ docker build -t blacktop/elk .
```
### Usage
```bash
$ docker run -i -t blacktop/elk
```
#### Output:
```bash

```
### Todo
- [x] Install/Run ELK
- [ ] Start Daemon and watch folder with supervisord
- [ ] Integrate with Bro-IDS
