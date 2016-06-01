![elk-logo](https://raw.githubusercontent.com/blacktop/docker-elk/master/docs/elk-logo.png)
ELK Stack Dockerfile
====================

[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)
[![Docker Stars](https://img.shields.io/docker/stars/blacktop/elk.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/blacktop/elk.svg)][hub]

This repository contains a **Dockerfile** of [ELK](http://www.elasticsearch.org/overview/elkdownloads/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/blacktop/elk/) published to the public [Docker Registry](https://index.docker.io/).

### Dependencies

* [java:8-jre](https://registry.hub.docker.com/_/java/)
* [Elasticsearch](https://www.elastic.co/products/elasticsearch) 5.0.0-alpha3
* [Logstash](https://www.elastic.co/products/logstash) 5.0.0-alpha3
* [Kibana](https://www.elastic.co/products/kibana) 5.0.0-alpha3

### Image Tags
```bash
$ docker images

REPOSITORY          TAG                 VIRTUAL SIZE
blacktop/elk        latest              665   MB
blacktop/elk        5.0-alpha           665   MB
blacktop/elk        4.4                 665   MB
blacktop/elk        4.3                 688   MB
blacktop/elk        4.2                 669   MB
blacktop/elk        3                   542   MB
```

### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/blacktop/elk/) from public [Docker Registry](https://index.docker.io/): `docker pull blacktop/elk`

### Usage
```bash
$ docker run -d --name elk -p 80:80 -p 9200:9200 -e ES_JAVA_OPTS="-Xms2g -Xmx2g" blacktop/elk
```
> **NOTE:** `ES_JAVA_OPTS="-Xms2g -Xmx2g"` sets the HEAP_MAX and HEAP_MIN to 2GB.

Now navigate to `$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' elk)`

### To Run on OSX
 - Install [Homebrew](http://brew.sh)

```bash
$ brew install caskroom/cask/brew-cask
$ brew cask install virtualbox
$ brew install docker
$ brew install docker-machine
$ docker-machine create --driver virtualbox default
$ eval $(docker-machine env default)
```

#### If you are using [docker-machine](https://docs.docker.com/machine/)

Navigate to `$(docker-machine ip dev)`

As a convenience you can add the **docker-machine** IP to you **/etc/hosts** file:

```bash
$ echo $(docker-machine ip dev) dockerhost | sudo tee -a /etc/hosts
```
Now you can navigate to [http://dockerhost](http://dockerhost) from your host and login with: **user:** `admin`/**password:**  `admin`

### Example Usage
Let us index some data into Elasticsearch so we can try it out.  To do this you can run `config/test_index.py` which contains the following code:
```bash
$ pip install elasticsearch
```
```
from datetime import datetime
from elasticsearch import Elasticsearch

es = Elasticsearch(['http://<docker.container.ip>'])

for i in range(10000):
    doc = {'author': 'kimchy', 'text': 'Elasticsearch: cool. bonsai cool.', 'timestamp': datetime.now()}
    res = es.index(index="test-index", doc_type='tweet', id=i, body=doc)
    # print(res['created'])

res = es.get(index="test-index", doc_type='tweet', id=1)
print(res['_source'])

es.indices.refresh(index="test-index")

res = es.search(index="test-index", body={"query": {"match_all": {}}})
print("Got %d Hits:" % res['hits']['total'])
for hit in res['hits']['hits']:
    print("%(timestamp)s %(author)s: %(text)s" % hit["_source"])
```

 - Navigate to the docker-machine ip or docker ip in a web browser.
 - You will be prompted for a user/pass which defaults to:
  - **user:**  `admin`
  - **password:**  `admin`

 - Now enter `test-index` in the index field and select **timestamp**

![elk-logo](https://raw.githubusercontent.com/blacktop/docker-elk/master/docs/timestamp.png)

 - Go to the **Discover Tab** and see those absolutely gorgeous logs!

![elk-logo](https://raw.githubusercontent.com/blacktop/docker-elk/master/docs/discover.png)

#### Change Kibana Nginx password
```bash
$ docker exec -it elk bash
```
```bash
root@593cf95bd8cc:/# htpasswd -D /etc/nginx/.htpasswd admin
Deleting password for user admin

root@593cf95bd8cc:/# htpasswd /etc/nginx/.htpasswd blacktop
New password: *****
Re-type new password: *****
Adding password for user blacktop

root@593cf95bd8cc:/# exit
```

### Todo
- [x] Install/Run ELK
- [x] Start Daemon and watch folder with supervisord
- [x] Expose Logstash config folder as well as Nginx sites folder as Volumes
- [ ] Add SSL
- [ ] Integrate with Bro-IDS

[hub]: https://hub.docker.com/r/blacktop/elk/
