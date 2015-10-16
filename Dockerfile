FROM java:8-jre

MAINTAINER blacktop, https://github.com/blacktop

ENV ELASTICSEARCH_MAJOR 2.0
ENV ELASTICSEARCH_VERSION 2.0.0~rc1
ENV LOGSTASH_MAJOR 2.0
ENV LOGSTASH_VERSION 1:2.0.0-beta2-1
ENV KIBANA_VERSION 4.2.0-beta2-linux-x64

# Grab gosu for easy step-down from root
RUN curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.6/gosu-$(dpkg --print-architecture)" \
	&& chmod +x /usr/local/bin/gosu

# Install ELK Required Dependancies
RUN set -x \
  && apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 46095ACC8548582C1A2699A9D27D666CD88E42B4 \
  && echo "deb http://packages.elasticsearch.org/elasticsearch/2.x/debian stable main" >> /etc/apt/sources.list \
  && echo "deb http://packages.elasticsearch.org/logstash/${LOGSTASH_MAJOR}/debian stable main" >> /etc/apt/sources.list \
  && apt-get -qq update && apt-get -qy install apache2-utils \
                                               supervisor \
                                               logstash=$LOGSTASH_VERSION \
																							 elasticsearch=$ELASTICSEARCH_VERSION \
                                               nginx --no-install-recommends \
  && apt-get clean \
  && apt-get autoclean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Kibana and Configure Nginx
ADD https://download.elastic.co/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz /opt/
ADD conf/kibana.conf /etc/nginx/sites-available/

# Configure Nginx
RUN cd /opt \
  && echo "Installing Kibana $KIBANA_VERSION..." \
  && tar xzf kibana-$KIBANA_VERSION.tar.gz \
  && ln -s /opt/kibana-$KIBANA_VERSION /opt/kibana \
	&& groupadd -r kibana && useradd -r -m -g kibana kibana \
	&& chown -R kibana:kibana /opt/kibana \
  && rm kibana-$KIBANA_VERSION.tar.gz \
  && echo "Configuring Nginx..." \
  && mkdir -p /var/www \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log \
  && echo "\ndaemon off;" >> /etc/nginx/nginx.conf \
  && rm /etc/nginx/sites-enabled/default \
  && ln -s /etc/nginx/sites-available/kibana.conf /etc/nginx/sites-enabled/kibana.conf

ENV PATH /usr/share/elasticsearch/bin:$PATH

RUN set -ex \
	&& for path in \
		/usr/share/elasticsearch/data \
		/usr/share/elasticsearch/logs \
		/usr/share/elasticsearch/config \
		/usr/share/elasticsearch/config/scripts \
	; do \
		mkdir -p "$path"; \
		chown -R elasticsearch:elasticsearch "$path"; \
	done

# COPY config /usr/share/elasticsearch/config/
ENV PATH /usr/share/elasticsearch/bin:$PATH
ENV PATH /opt/logstash/bin:$PATH
ENV PATH /opt/kibana/bin:$PATH
# Add admin/admin web user account
COPY conf/htpasswd /etc/nginx/.htpasswd
COPY conf/elastic-logging.yml /usr/share/elasticsearch/config/logging.yml
COPY elastic-entrypoint.sh /
COPY logstash-entrypoint.sh /
COPY kibana-entrypoint.sh /
RUN chmod +x /*.sh

COPY conf/supervisord.conf /etc/supervisor/conf.d/

VOLUME ["/usr/share/elasticsearch/data"]
VOLUME ["/etc/logstash/conf.d"]
VOLUME ["/etc/nginx"]

EXPOSE 80 443 9200 9300

CMD ["/usr/bin/supervisord"]
