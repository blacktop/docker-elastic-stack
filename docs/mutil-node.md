## To build a multi-node cluster

```bash
$ wget https://github.com/blacktop/docker-elastic-stack/raw/master/docker-compose.yml
$ docker-compose up -d && docker-compose scale data=3
```

> **NOTE**
 * Nodes have [X-Pack](https://www.elastic.co/products/x-pack) Plugin (*30 day trial*) installed  
 * Assumes your **data.nodes** have at least 4GB of RAM.

With X-Pack the default user/pass is **elastic/changeme**
