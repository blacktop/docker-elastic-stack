ELK Stack Dockerfile
=============

This repository contains a **Dockerfile** of [ELK](http://www.elasticsearch.org/overview/elkdownloads/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/blacktop/elk/) published to the public [Docker Registry](https://index.docker.io/).

### Dependencies

* [debian:jessie](https://index.docker.io/_/debian/)

### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/blacktop/elk/) from public [Docker Registry](https://index.docker.io/): `docker pull blacktop/elk`

#### Alternatively, build an image from Dockerfile
```bash
$ docker build -t blacktop/elk .
```
### Usage
```bash
$ docker run -i -t -p 8080:80 blacktop/elk
```
#### Output:
```bash

```
### Todo
- [x] Install/Run ELK
- [x] Start Daemon and watch folder with supervisord
- [ ] Integrate with Bro-IDS
