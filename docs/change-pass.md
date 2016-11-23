## Change kibana's nginx default user and password

> which defaults to `admin/admin`

```bash
$ docker run -d --name elstack \
  -p 80:80 \
  -p 443:443 \
  -p 9200:9200 \
  -e SSL=true \
  -e ELSK_USER="blacktop" \
  -e ELSK_PASS="S3cr3T" \
  blacktop/elastic-stack
```

> **NOTE:** You can only set a **user/pass** if `SSL` is enabled via the env var as seen above.

### To use your own SSL certs

See [here](ssl.md#to-supply-your-own-ssl-certs)
