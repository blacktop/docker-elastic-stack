#!/bin/bash

set -e

# Add metricbeat as command if needed
if [ "${1:0:1}" = '-' ]; then

	set -- metricbeat "$@"
fi

exec "$@"
