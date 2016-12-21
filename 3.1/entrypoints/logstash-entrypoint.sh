#!/bin/sh

set -e

# Add logstash as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- logstash "$@"
fi

# Run as user "elstack" if the command is "logstash"
if [ "$1" = 'logstash' ]; then
	chown -R elstack:elstack /usr/share/logstash
	chown -R elstack:elstack /etc/logstash/conf.d/
	chown -R elstack:elstack /opt/logstash/patterns

	set -- su-exec elstack tini -- "$@"
fi

exec "$@"
