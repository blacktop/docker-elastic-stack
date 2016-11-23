## To enable SSL  

```bash
$ docker run -d --name elstack -e SSL=true -p 80:80 -p 443:443 -p 9200:9200 blacktop/elastic-stack
```

> This will generate a self-signed cert if none is supplied  
> It will also set a basic auth **user/pass** of `admin/admin` if none are supplied.  

##### Now Navigate To

-	With [Docker for Mac](https://docs.docker.com/engine/installation/mac/) : `https://localhost`
-	With [docker-machine](https://docs.docker.com/machine/) : `https://$(docker-machine ip)`
-	With [docker-engine](https://docker.github.io/engine/installation/) : `https://$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' elstack)`

### To change the domain in the auto-generated self-signed SSL cert set the `ELSK_DOMAIN` var  

```bash
$ docker run -d --name elstack \
  -p 80:80 \
  -p 443:443 \
  -p 9200:9200 \
  -e SSL=true \  
  -e ELSK_DOMAIN="elk.blacktop.io" \  
  blacktop/elastic-stack
```

> **NOTE:** the `ELSK_DOMAIN` defaults to `localhost`

### To supply your own SSL certs  

Create certs with the following names

 - `kibana.key`  
 - `kibana.crt`  

```bash
$ docker run -d --name elstack \
  -p 80:80 \
  -p 443:443 \
  -p 9200:9200 \
  -e SSL=true \
  -v /path/to/kibana/certs:/etc/nginx/ssl:ro \  
  blacktop/elastic-stack
```

> **NOTE:** It will also set a basic auth **user/pass** of `admin/admin` if none are supplied.  

### To set your own user/pass  

See [here](change-pass.md)
