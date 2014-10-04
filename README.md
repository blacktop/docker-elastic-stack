![elk-logo](https://raw.githubusercontent.com/blacktop/docker-elk/master/logo.png)
ELK Stack Dockerfile
===================

This repository contains a **Dockerfile** of [ELK](http://www.elasticsearch.org/overview/elkdownloads/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/blacktop/elk/) published to the public [Docker Registry](https://index.docker.io/).

### Dependencies

* [debian:wheezy](https://index.docker.io/_/debian/)

### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/blacktop/elk/) from public [Docker Registry](https://index.docker.io/): `docker pull blacktop/elk`

#### Alternatively, build an image from Dockerfile
```bash
$ docker build -t blacktop/elk github.com/blacktop/docker-elk
```
### Usage
```bash
$ docker run -i -t -p 8080:80 blacktop/elk
```
#### Now navigate to `<Container's IP>:8080`

#### If you are using [boot2docker](http://boot2docker.io)
```bash
Navigate to $(boot2docker ip):8080
```

### Todo
- [x] Install/Run ELK
- [x] Start Daemon and watch folder with supervisord
- [x] Expose Logstach config folder volume as well as Nginx sites folder volume
- [ ] Rewrite Dockerfile to use GitHub Release tags
- [ ] Integrate with Bro-IDS
