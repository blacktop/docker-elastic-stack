## Change kibana's nginx default user and password (which defaults to **admin/admin**)

```bash
$ docker run -d --name elstack \
  -e SSL=true \
  -e ELSK_USER="blacktop" \
  -e ELSK_PASS="S3cr3T" \
  -p 80:80 \
  -p 443:443 \
  -p 9200:9200 \
  blacktop/elastic-stack
```
