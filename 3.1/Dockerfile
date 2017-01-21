FROM gliderlabs/alpine:3.4

LABEL maintainer "https://github.com/blacktop"

RUN apk-install openjdk8-jre tini su-exec

# ENV ELASTIC 1.7.6
# ENV LOGSTASH 1.5.6
ENV ELASTIC 2.4.2
ENV LOGSTASH 2.4.1
ENV KIBANA 3.1.3

RUN apk-install libzmq bash nodejs supervisor nginx apache2-utils
RUN mkdir -p /usr/local/lib \
	&& ln -s /usr/lib/*/libzmq.so.3 /usr/local/lib/libzmq.so
RUN apk-install -t .build-deps wget ca-certificates \
  && set -x \
  && cd /tmp \
  && echo "Download Elastic Stack ======================================================" \
  && echo "Download Elasticsearch..." \
  && wget -O elasticsearch-$ELASTIC.tar.gz https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$ELASTIC/elasticsearch-$ELASTIC.tar.gz \
  && tar -xzf elasticsearch-$ELASTIC.tar.gz \
  && mv elasticsearch-$ELASTIC /usr/share/elasticsearch \
  && echo "Download Logstash..." \
  && wget -O logstash-$LOGSTASH.tar.gz \
    https://download.elastic.co/logstash/logstash/logstash-$LOGSTASH.tar.gz \
  && tar -xzf logstash-$LOGSTASH.tar.gz \
  && mv logstash-$LOGSTASH /usr/share/logstash \
  && echo "Download Kibana..." \
  && wget -O kibana-$KIBANA.tar.gz https://download.elastic.co/kibana/kibana/kibana-$KIBANA.tar.gz \
  && tar -xzf kibana-$KIBANA.tar.gz \
  && mv kibana-$KIBANA /usr/share/kibana \
  && echo "Configure [Elasticsearch] ===================================================" \
  && for path in \
  	/usr/share/elasticsearch/data \
  	/usr/share/elasticsearch/logs \
  	/usr/share/elasticsearch/config \
  	/usr/share/elasticsearch/config/scripts \
  	/usr/share/elasticsearch/plugins \
  ; do \
  mkdir -p "$path"; \
  done \
  && echo "Configure [Logstash] ========================================================" \
  && if [ -f "$LS_SETTINGS_DIR/logstash.yml" ]; then \
  		sed -ri 's!^(path.log|path.config):!#&!g' "$LS_SETTINGS_DIR/logstash.yml"; \
  	fi \
  && echo "Configure [Kibana] ==========================================================" \
  && mkdir -p /var/www \
  && ln -s /usr/share/kibana /var/www/kibana \
  && ls -lah /var/www/kibana \
  && ls -lah /usr/share/kibana \
  && sed -i 's/9200"/"+ window.location.port/g' /var/www/kibana/config.js \
  && echo "Create elstack user..." \
  && adduser -DH -s /sbin/nologin elstack \
  && chown -R elstack:elstack /usr/share/elasticsearch \
  && chown -R elstack:elstack /usr/share/logstash \
  && chown -R elstack:elstack /usr/share/kibana \
  && echo "Clean Up..." \
  && rm -rf /tmp/* \
  && apk del --purge .build-deps

ENV PATH /usr/share/elasticsearch/bin:$PATH
ENV PATH /usr/share/logstash/bin:$PATH
ENV PATH /usr/share/kibana/bin:$PATH

# Add custom elasticsearch config
COPY config/elastic /usr/share/elasticsearch/config
COPY config/elastic/logrotate /etc/logrotate.d/elasticsearch
# Add custom logstash config
COPY config/logstash/conf.d/ /etc/logstash/conf.d/
COPY config/logstash/patterns/ /opt/logstash/patterns/
COPY config/logstash/logstash.yml /etc/logstash/
# necessary for 5.0+ (overriden via "--path.settings", ignored by < 5.0)
ENV LS_SETTINGS_DIR /etc/logstash
# Add custom nginx config
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx/kibana.conf /etc/nginx/conf.d/
COPY config/nginx/htpasswd /etc/nginx/htpasswd.users
# Add custom supervisor config
COPY config/supervisord/supervisord.conf /etc/supervisor/

# Add entrypoints
COPY entrypoints/elastic-entrypoint.sh /
COPY entrypoints/logstash-entrypoint.sh /

VOLUME ["/usr/share/elasticsearch/data"]
VOLUME ["/etc/logstash/conf.d"]
VOLUME ["/usr/share/kibana/app/dashboards"]
VOLUME ["/etc/nginx"]

EXPOSE 80 443 9200 9300

CMD ["/sbin/tini","--","/usr/bin/supervisord","-c", "/etc/supervisor/supervisord.conf"]
