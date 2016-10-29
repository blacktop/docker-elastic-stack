#!/bin/sh

set -e

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
	# Change the ownership of /usr/share/elasticsearch/data to elasticsearch
	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

	set -- gosu elasticsearch /sbin/tini -- "$@"
	#exec gosu elasticsearch "$BASH_SOURCE" "$@"
fi

if [ "$1" = 'master' -a "$(id -u)" = '0' ]; then
	# Change node into a master node
	echo "node.master: true" >> /usr/share/elasticsearch/config/elasticsearch.yml
	echo "node.ingest: false" >> /usr/share/elasticsearch/config/elasticsearch.yml
	echo "node.data: false" >> /usr/share/elasticsearch/config/elasticsearch.yml

	# Change the ownership of /usr/share/elasticsearch/data to elasticsearch
	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

	set -- gosu elasticsearch /sbin/tini -- elasticsearch
	#exec gosu elasticsearch "$BASH_SOURCE" "$@"
fi

if [ "$1" = 'ingest' -a "$(id -u)" = '0' ]; then
	# Change node into a client node
	echo "node.master: false" >> /usr/share/elasticsearch/config/elasticsearch.yml
	echo "node.ingest: true" >> /usr/share/elasticsearch/config/elasticsearch.yml
	echo "node.data: false" >> /usr/share/elasticsearch/config/elasticsearch.yml
	echo "discovery.zen.ping.unicast.hosts: [\"elastic-master\"]" >> /usr/share/elasticsearch/config/elasticsearch.yml

	# Change the ownership of /usr/share/elasticsearch/data to elasticsearch
	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

	set -- gosu elasticsearch /sbin/tini -- elasticsearch
	#exec gosu elasticsearch "$BASH_SOURCE" "$@"
fi

if [ "$1" = 'data' -a "$(id -u)" = '0' ]; then
	# Change node into a data node
	echo "node.master: false" >> /usr/share/elasticsearch/config/elasticsearch.yml
	echo "node.ingest: false" >> /usr/share/elasticsearch/config/elasticsearch.yml
	echo "node.data: true" >> /usr/share/elasticsearch/config/elasticsearch.yml
	echo "discovery.zen.ping.unicast.hosts: [\"elastic-master\"]" >> /usr/share/elasticsearch/config/elasticsearch.yml

	# Change the ownership of /usr/share/elasticsearch/data to elasticsearch
	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

	set -- gosu elasticsearch /sbin/tini -- elasticsearch
	#exec gosu elasticsearch "$BASH_SOURCE" "$@"
fi

# As argument is not related to elasticsearch,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
