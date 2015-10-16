![elk-logo](https://raw.githubusercontent.com/blacktop/docker-elk/master/docs/elk-logo.png)
ELK Stack Dockerfile
===================

[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)

This repository contains a **Dockerfile** of [ELK](http://www.elasticsearch.org/overview/elkdownloads/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/blacktop/elk/) published to the public [Docker Registry](https://index.docker.io/).

### Dependencies

* [java:8-jre](https://registry.hub.docker.com/_/java/)
* [Elasticsearch](https://www.elastic.co/products/elasticsearch) 2.0.0-rc1
* [Logstash](https://www.elastic.co/products/logstash) 2.0.0-beta2
* [Kibana](https://www.elastic.co/products/kibana) 4.2.0 Beta 2

### Image Size
[![](https://badge.imagelayers.io/blacktop/elk:4.2.svg)](https://imagelayers.io/?images=blacktop/elk:4.2 'Get your own badge on imagelayers.io')

### Image Tags
```bash
$ docker images

REPOSITORY          TAG                 VIRTUAL SIZE
blacktop/elk        4.2                 904   MB
blacktop/elk        3                   542   MB
```

### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/blacktop/elk/) from public [Docker Registry](https://index.docker.io/): `docker pull blacktop/elk`

#### Alternatively, build an image from Dockerfile
```bash
$ docker build -t blacktop/elk github.com/blacktop/docker-elk
```
### Usage
```bash
$ docker run -d --name elk -p 80:80 -p 9200:9200 blacktop/elk
```
Now navigate to `$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' elk)`

### To Run on OSX
 - Install [Homebrew](http://brew.sh)

```bash
$ brew install caskroom/cask/brew-cask
$ brew cask install virtualbox
$ brew install docker
$ brew install docker-machine
$ docker-machine create --driver virtualbox dev
$ eval $(docker-machine env dev)
```

#### If you are using [docker-machine](https://docs.docker.com/machine/)

Navigate to `$(docker-machine ip dev)`

As a convenience you can add the **docker-machine** IP to you **/etc/hosts** file:

```bash
$ echo $(docker-machine ip dev) dockerhost | sudo tee -a /etc/hosts
```
Now you can navigate to [http://dockerhost](http://dockerhost) from your host

### Example Usage
Let us index some data into Elasticsearch so we can try it out.  To do this you can run `config/test_index.py` which contains the following code:

```
from datetime import datetime
from elasticsearch import Elasticsearch

es = Elasticsearch(['http://<enter docker-machine ip or ip assigned to docker container here>'])

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

### Todo
- [x] Install/Run ELK
- [x] Start Daemon and watch folder with supervisord
- [x] Expose Logstash config folder as well as Nginx sites folder as Volumes
- [ ] Rewrite Dockerfile to use GitHub Release tags
- [ ] Integrate with Bro-IDS
