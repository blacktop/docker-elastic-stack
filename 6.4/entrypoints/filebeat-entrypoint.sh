#!/bin/bash

set -e

# Add filebeat as command if needed
if [ "${1:0:1}" = '-' ]; then
	# wait for elasticsearch
	echo "Importing Dashboards..."
	sleep 10;/usr/share/filebeat/import_dashboards

	set -- filebeat "$@"
fi

exec "$@"
