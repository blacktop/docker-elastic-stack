#!/bin/bash

: ${ELSK_USER:="admin"}
: ${ELSK_PASS:="admin"}
: ${ELSK_DOMAIN:="localhost"}

if [ -z "$SSL" ]; then
		echo ">> using non-ssl nginx conf"
		rm /etc/nginx/conf.d/ssl.kibana.conf
		exec nginx -g 'daemon off;'
else
		echo ">> generating basic auth"
		htpasswd -b -c /etc/nginx/htpasswd.users "$ELSK_USER" "$ELSK_PASS"

		if [ ! -e "/etc/nginx/ssl/*.key" ]; then
			  echo ">> generating self signed cert"
			  openssl req -x509 -newkey rsa:4086 \
			  -subj "/C=XX/ST=XXXX/L=XXXX/O=XXXX/CN=$ELSK_DOMAIN" \
			  -keyout "/etc/nginx/ssl/kibana.key" \
			  -out "/etc/nginx/ssl/kibana.crt" \
			  -days 3650 -nodes -sha256
		fi

		echo ">>  using ssl nginx conf"
		rm /etc/nginx/conf.d/kibana.conf
		exec nginx -g 'daemon off;'
fi
