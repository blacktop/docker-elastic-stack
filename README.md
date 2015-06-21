![elk-logo](https://raw.githubusercontent.com/blacktop/docker-elk/master/logo.png)
ELK Stack Dockerfile
===================

[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)

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
$ docker run -i -t --name elk -p 8080:80 blacktop/elk
```
Now navigate to `$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' elk):8080`

#### If you are using [boot2docker](http://boot2docker.io)
```bash
Navigate to $(boot2docker ip):8080
```
As a convience you can add the **boot2docker** IP to you **/etc/hosts** file:
```bash
$ echo $(boot2docker ip) dockerhost | sudo tee -a /etc/hosts
```
Now you can navigate to http://dockerhost:8080 from your host

### Todo
- [x] Install/Run ELK
- [x] Start Daemon and watch folder with supervisord
- [x] Expose Logstash config folder as well as Nginx sites folder as Volumes
- [ ] Rewrite Dockerfile to use GitHub Release tags
- [ ] Integrate with Bro-IDS
