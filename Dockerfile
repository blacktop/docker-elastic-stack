FROM debian:wheezy

MAINTAINER blacktop, https://github.com/blacktop

ENV KIBANA_VERSION 4.0.1-linux-x64

# Install ELK Required Dependancies
RUN set -x \
  && apt-get -qq update \
  && apt-get -qy install wget --no-install-recommends \
  && wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add - \
  && echo "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main" >> /etc/apt/sources.list \
  && echo 'deb http://packages.elasticsearch.org/logstash/1.4/debian stable main' >> /etc/apt/sources.list \
  && apt-get -qq update && apt-get -qy install elasticsearch \
                                               apache2-utils \
                                               supervisor \
                                               logstash \
                                               nginx \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Kibana and Configure Nginx
ADD https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz /opt/
ADD kibana.conf /etc/nginx/sites-available/

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
COPY htpasswd /etc/nginx/.htpasswd

ADD supervisord.conf /etc/supervisor/conf.d/

VOLUME ["/etc/logstash/conf.d"]
VOLUME ["/etc/nginx"]

EXPOSE 80 443 9200

CMD ["/usr/bin/supervisord"]
