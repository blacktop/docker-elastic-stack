## Change Kibana's Nginx password

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
