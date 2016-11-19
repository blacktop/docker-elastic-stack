## To enable SSL  

```bash
$ docker run -d --name elstack -e SSL=true -p 80:80 -p 443:443 -p 9200:9200 blacktop/elastic-stack
```

This will generate a self-signed cert if none are supplied  
It will also set a basic auth **user/pass** of `admin/admin` if none are supplied.

### To supply your own SSL certs  

Create certs with the following names

 - `/etc/nginx/ssl/kibana.key`  
 - `/etc/nginx/ssl/kibana.crt`  

```bash
$ docker run -d --name elstack -e SSL=true -p 80:80 -p 443:443 -p 9200:9200 blacktop/elastic-stack$ docker run -d --name elstack \
  -e SSL=true \
  -v /path/to/kibana/certs:/etc/nginx/ssl:ro \
  -p 80:80 \
  -p 443:443 \
  -p 9200:9200 \
  blacktop/elastic-stack
```

### To set your own user/pass  

See [here](change-pass.md)
