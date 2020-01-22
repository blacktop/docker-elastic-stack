FROM node:10.15.2-alpine

LABEL maintainer "https://github.com/blacktop"

RUN apk add --no-cache openjdk8-jre tini su-exec

ENV STACK 7.5.2

RUN apk add --no-cache libzmq bash nodejs nginx apache2-utils openssl nss
RUN mkdir -p /usr/local/lib \
	&& ln -s /usr/lib/*/libzmq.so.3 /usr/local/lib/libzmq.so
RUN apk add --no-cache -t .build-deps wget ca-certificates \
	&& set -x \
	&& cd /tmp \
	&& echo "Download Elastic Stack ======================================================" \
	&& echo "Download Elasticsearch..." \
	&& wget --progress=bar:force -O elasticsearch-$STACK.tar.gz https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-oss-$STACK-no-jdk-linux-x86_64.tar.gz \
	&& tar -xzf elasticsearch-$STACK.tar.gz \
	&& mv elasticsearch-$STACK /usr/share/elasticsearch \
	&& echo "Download Logstash..." \
	&& wget --progress=bar:force -O logstash-$STACK.tar.gz \
	https://artifacts.elastic.co/downloads/logstash/logstash-oss-$STACK.tar.gz \
	&& tar -xzf logstash-$STACK.tar.gz \
	&& mv logstash-$STACK /usr/share/logstash \
	&& echo "Download Kibana..." \
	&& wget --progress=bar:force -O kibana-$STACK.tar.gz https://artifacts.elastic.co/downloads/kibana/kibana-oss-$STACK-linux-x86_64.tar.gz \
	&& tar -xzf kibana-$STACK.tar.gz \
	&& mv kibana-$STACK-linux-x86_64 /usr/share/kibana \
	&& echo "Configure [Elasticsearch] ===================================================" \
	&& for path in \
	/usr/share/elasticsearch/data \
	/usr/share/elasticsearch/logs \
	/usr/share/elasticsearch/config \
	/usr/share/elasticsearch/config/scripts \
	/usr/share/elasticsearch/plugins \
	/usr/share/elasticsearch/tmp \
	; do \
	mkdir -p "$path"; \
	done \
	&& echo "Configure [Logstash] ========================================================" \
	&& if [ -f "$LS_SETTINGS_DIR/logstash.yml" ]; then \
	sed -ri 's!^(path.log|path.config):!#&!g' "$LS_SETTINGS_DIR/logstash.yml"; \
	fi \
	&& echo "Configure [Kibana] ==========================================================" \
	# the default "server.host" is "localhost" in 5+
	&& sed -ri "s!^(\#\s*)?(server\.host:).*!\2 '0.0.0.0'!" /usr/share/kibana/config/kibana.yml \
	&& grep -q "^server\.host: '0.0.0.0'\$" /usr/share/kibana/config/kibana.yml \
	# usr alpine nodejs and not bundled version
	&& bundled='NODE="${DIR}/node/bin/node"' \
	&& alpine_node='NODE="/usr/local/bin/node"' \
	&& sed -i "s|$bundled|$alpine_node|g" /usr/share/kibana/bin/kibana-plugin \
	&& sed -i "s|$bundled|$alpine_node|g" /usr/share/kibana/bin/kibana \
	&& echo "Make Nginx SSL directory..." \
	&& mkdir -p /etc/nginx/ssl \
	&& rm /etc/nginx/conf.d/default.conf \
	&& echo "Create elstack user..." \
	&& adduser -DH -s /sbin/nologin elstack \
	&& chown -R elstack:elstack /usr/share/elasticsearch \
	&& chown -R elstack:elstack /usr/share/logstash \
	&& chown -R elstack:elstack /usr/share/kibana \
	&& echo "Clean Up..." \
	&& rm -rf /tmp/* \
	&& rm -rf /usr/share/kibana/node \
	&& apk del --purge .build-deps

RUN apk add --no-cache supervisor libc6-compat

ENV PATH /usr/share/elasticsearch/bin:$PATH
ENV PATH /usr/share/logstash/bin:$PATH
ENV PATH /usr/share/kibana/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

# Add custom elasticsearch config
COPY config/elastic /usr/share/elasticsearch/config
COPY config/elastic/logrotate /etc/logrotate.d/elasticsearch

# Add custom logstash config
COPY config/logstash/conf.d/ /etc/logstash/conf.d/
COPY config/logstash/patterns/ /opt/logstash/patterns/
COPY config/logstash/logstash.yml /etc/logstash/

# necessary for 5.0+ (overriden via "--path.settings", ignored by < 5.0)
ENV LS_SETTINGS_DIR /etc/logstash

# fixes mktemp issue in alpine
ENV ES_TMPDIR /usr/share/elasticsearch/tmp

# Add custom nginx config
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx/kibana.conf /etc/nginx/conf.d/
COPY config/nginx/ssl.kibana.conf /etc/nginx/conf.d/

# Add custom supervisor config
COPY config/supervisord/supervisord.conf /etc/supervisor/

# Add entrypoints
COPY entrypoints/elastic-entrypoint.sh /
COPY entrypoints/logstash-entrypoint.sh /
COPY entrypoints/kibana-entrypoint.sh /
COPY entrypoints/nginx-entrypoint.sh /
RUN chmod +x /*entrypoint.sh

VOLUME ["/usr/share/elasticsearch/data"]
VOLUME ["/etc/logstash/conf.d"]
VOLUME ["/etc/nginx"]

EXPOSE 80 443 5601 9200 9300

CMD ["/sbin/tini","--","/usr/bin/supervisord","-c", "/etc/supervisor/supervisord.conf"]
