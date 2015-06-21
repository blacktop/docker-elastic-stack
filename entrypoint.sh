#!/bin/sh

set -e

KIBANA_ES_URL=${KIBANA_ES_URL:-http://localhost:9200}
KIBANA_INDEX=${KIBANA_INDEX:-kibana-int}

sed -i "s;^elasticsearch:.*;elasticsearch: ${KIBANA_ES_URL};" "/opt/kibana-${KIBANA_VERSION}/config/kibana.yml"
sed -i "s;^kibana_index:.*;kibana_index: ${KIBANA_INDEX};" "/opt/kibana-${KIBANA_VERSION}/config/kibana.yml"

exec /opt/elasticsearch-${ELASTICSEARCH_VERSION}/bin/elasticsearch -Des.http.port=9200 &
exec /opt/logstash-${LOGSTASH_VERSION}/bin/logstash -e 'input { stdin { } } output { elasticsearch { host => localhost } }' &
exec /opt/kibana-${KIBANA_VERSION}/bin/kibana
