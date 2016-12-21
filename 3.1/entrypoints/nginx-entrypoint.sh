#!/bin/sh

set -e

# Add logstash as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- nginx "$@"
fi

# Run as user "nginx" if the command is "nginx"
if [ "$1" = 'nginx' ]; then

	set -- su-exec elstack tini -- "$@"
fi

exec "$@"
