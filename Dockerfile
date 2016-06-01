FROM java:8-jre

MAINTAINER blacktop, https://github.com/blacktop

ENV KIBANA_VERSION 5.0.0-alpha3
ENV KIBANA_REPO_BASE http://packages.elastic.co/kibana/5.0.0-alpha/debian
ENV ELASTICSEARCH_VERSION 5.0.0~alpha3
ENV ELASTICSEARCH_REPO_BASE http://packages.elasticsearch.org/elasticsearch/5.x/debian
ENV LOGSTASH_VERSION 1:5.0.0~alpha3-1
ENV LOGSTASH_REPO_BASE http://packages.elastic.co/logstash/5.0/debian

# Grab gosu for easy step-down from root
ENV GOSU_VERSION 1.7
ENV GOSU_URL https://github.com/tianon/gosu/releases/download
RUN set -x \
	&& wget -O /usr/local/bin/gosu "$GOSU_URL/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
	&& wget -O /usr/local/bin/gosu.asc "$GOSU_URL/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
	&& gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
	&& rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu \
	&& gosu nobody true

# Grab tini for signal processing and zombie killing
ENV TINI_VERSION v0.9.0
RUN set -x \
	&& wget -O /usr/local/bin/tini "https://github.com/krallin/tini/releases/download/$TINI_VERSION/tini" \
	&& wget -O /usr/local/bin/tini.asc "https://github.com/krallin/tini/releases/download/$TINI_VERSION/tini.asc" \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 6380DC428747F6C393FEACA59A84159D7001A4E5 \
	&& gpg --batch --verify /usr/local/bin/tini.asc /usr/local/bin/tini \
	&& rm -r "$GNUPGHOME" /usr/local/bin/tini.asc \
	&& chmod +x /usr/local/bin/tini \
	&& tini -h

# Install plugin dependencies
RUN set -x \
	&& apt-get -qq update \
	&& apt-get install -y --no-install-recommends libzmq3 \
	&& mkdir -p /usr/local/lib \
	&& ln -s /usr/lib/*/libzmq.so.3 /usr/local/lib/libzmq.so \
  && apt-get autoclean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install ELK Required Dependancies
RUN set -x \
	&& apt-get -qq update \
	&& apt-get install -yq wget ca-certificates \
	&& wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add - \
	&& echo "deb $KIBANA_REPO_BASE stable main" >> /etc/apt/sources.list \
	&& echo "deb $LOGSTASH_REPO_BASE stable main" >> /etc/apt/sources.list \
	&& echo "deb $ELASTICSEARCH_REPO_BASE stable main" >> /etc/apt/sources.list \
	&& apt-get -qq update && apt-get -yq install elasticsearch=$ELASTICSEARCH_VERSION \
																							 logstash=$LOGSTASH_VERSION \
                                               kibana=$KIBANA_VERSION \
                                               apache2-utils \
                                               supervisor \
																							 logrotate \
                                               nginx --no-install-recommends \
  && apt-get purge -y --auto-remove wget \
  && apt-get clean \
  && apt-get autoclean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& echo "Creating Elasticsearch Paths..." \
	&& for path in \
				/usr/share/elasticsearch/data \
				/usr/share/elasticsearch/logs \
				/usr/share/elasticsearch/config \
				/usr/share/elasticsearch/config/scripts \
	; do \
			mkdir -p "$path"; \
			chown -R elasticsearch:elasticsearch "$path"; \
	done

# Configure Nginx
ADD config/nginx/kibana.conf /etc/nginx/sites-available/
RUN cd /opt \
	&& echo "Configuring Nginx..." \
	&& mkdir -p /var/www \
	&& ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log \
	&& echo "\ndaemon off;" >> /etc/nginx/nginx.conf \
	&& rm /etc/nginx/sites-enabled/default \
	&& ln -s /etc/nginx/sites-available/kibana.conf /etc/nginx/sites-enabled/kibana.conf

# Install Kibana Plugins
RUN /opt/kibana/bin/kibana-plugin install timelion
# RUN /opt/kibana/bin/kibana-plugin install x-pack

# Add ELK PATHs
ENV PATH /usr/share/elasticsearch/bin:$PATH
ENV PATH /opt/logstash/bin:$PATH
ENV PATH /opt/kibana/bin:$PATH

# Add admin/admin web user account
COPY config/nginx/htpasswd /etc/nginx/.htpasswd
# Add configs
COPY config/elastic /usr/share/elasticsearch/config
COPY config/supervisord/supervisord.conf /etc/supervisor/conf.d/
# Add entrypoints
COPY entrypoints/elastic-entrypoint.sh /
COPY entrypoints/logstash-entrypoint.sh /
COPY entrypoints/kibana-entrypoint.sh /
RUN chmod +x /*.sh

VOLUME ["/usr/share/elasticsearch/data"]
VOLUME ["/etc/logstash/conf.d"]
VOLUME ["/etc/nginx"]

EXPOSE 80 443 9200 9300

CMD ["/usr/bin/supervisord"]
