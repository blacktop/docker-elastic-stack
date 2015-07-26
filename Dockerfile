FROM java:8-jre

MAINTAINER blacktop, https://github.com/blacktop

ENV KIBANA_VERSION 4.1.1-linux-x64

# Install ELK Required Dependancies
RUN set -x \
  && apt-get -qq update \
  && apt-get -qy install wget --no-install-recommends \
  && wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add - \
  && echo "deb http://packages.elastic.co/elasticsearch/1.7/debian stable main" >> /etc/apt/sources.list \
  && echo "deb http://packages.elasticsearch.org/logstash/1.5/debian stable main" >> /etc/apt/sources.list \
  && apt-get -qq update && apt-get -qy install elasticsearch \
                                               apache2-utils \
                                               supervisor \
                                               logstash \
                                               nginx \
  && apt-get purge -y --auto-remove wget \
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
  && rm kibana-$KIBANA_VERSION.tar.gz \
  && echo "Configuring Nginx..." \
  && mkdir -p /var/www \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log \
  && echo "\ndaemon off;" >> /etc/nginx/nginx.conf \
  && rm /etc/nginx/sites-enabled/default \
  && ln -s /etc/nginx/sites-available/kibana.conf /etc/nginx/sites-enabled/kibana.conf

# Add admin/admin web user account
COPY conf/htpasswd /etc/nginx/.htpasswd

ADD conf/supervisord.conf /etc/supervisor/conf.d/

VOLUME ["/etc/logstash/conf.d"]
VOLUME ["/etc/nginx"]

EXPOSE 80 443 9200

CMD ["/usr/bin/supervisord"]
