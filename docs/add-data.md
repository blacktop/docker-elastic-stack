## Add Some Demo Data

```bash
$ docker run -d --name elstack -p 80:80 -p 9200:9200 blacktop/elastic-stack:geoip \
  && sleep 10 \
  && docker run --rm --link elstack:elasticsearch blacktop/es-data
```

Click on `nginx_json_elastic_stack_example` and :star: **Set as default index**  

![elk-logo](https://raw.githubusercontent.com/blacktop/docker-elk/master/docs/img/add-data-index.png)

Click on **Dashboard** -> **Open** -> `Sample Dashboard for Nginx (JSON) Logs`  

![elk-logo](https://raw.githubusercontent.com/blacktop/docker-elk/master/docs/img/add-data-dashboard.png)

## Add Data with Python

Let us index some data into Elasticsearch so we can try it out. To do this you can run `config/test_index.py` which contains the following code:

```bash
$ pip install elasticsearch
```

```python
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

-	Navigate to the docker-machine ip or docker ip in a web browser.
-	Now enter `test-index` in the index field and select **timestamp**

![elk-logo](https://raw.githubusercontent.com/blacktop/docker-elk/master/docs/img/timestamp.png)

-	Go to the **Discover Tab** and see those absolutely gorgeous logs!

![elk-logo](https://raw.githubusercontent.com/blacktop/docker-elk/master/docs/img/python-data.png)

## Tips and Tricks

If you are using [docker-machine](https://docs.docker.com/machine/) navigate to `$(docker-machine ip)`

As a convenience you can add the **docker-machine** IP to you **/etc/hosts** file:

```bash
$ echo $(docker-machine ip) dockerhost | sudo tee -a /etc/hosts
```

Now you can navigate to [http://dockerhost](http://dockerhost) from your host
