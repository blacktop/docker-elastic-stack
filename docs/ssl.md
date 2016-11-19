## To enable SSL  

```bash
$ docker run -d --name elstack -e SSL=true -p 80:80 -p 443:443 -p 9200:9200 blacktop/elastic-stack
```

This will generate a self-signed cert if none are supplied  
It will also set a basic auth **user/pass** of `admin/admin` if none are supplied.

### To change the domain in the auto-generated self-signed SSL cert set the `DOMAIN` var  

```bash
$ docker run -d --name elstack \
  -e SSL=true \
  -e DOMAIN="elk.blacktop.io" \
  -p 80:80 \
  -p 443:443 \
  -p 9200:9200 \
  blacktop/elastic-stack
```

> **NOTE:** the `DOMAIN` defaults to `localhost`

### To supply your own SSL certs  

Create certs with the following names

 - `kibana.key`  
 - `kibana.crt`  

```bash
$ docker run -d --name elstack \
  -e SSL=true \
  -v /path/to/kibana/certs:/etc/nginx/ssl:ro \
  -p 80:80 \
  -p 443:443 \
  -p 9200:9200 \
  blacktop/elastic-stack
```

### To set your own user/pass  

See [here](change-pass.md)
