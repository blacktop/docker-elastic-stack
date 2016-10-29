#!/bin/sh

set -e

# Add logstash as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- logstash "$@"
fi

# Run as user "logstash" if the command is "logstash"
if [ "$1" = 'logstash' ]; then
	chown -R logstash:logstash /usr/share/logstash

	set -- gosu logstash tini -- "$@"
fi

exec "$@"
