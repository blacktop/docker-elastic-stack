FROM debian:jessie

MAINTAINER blacktop, https://github.com/blacktop

RUN echo '#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d && \
    chmod +x /usr/sbin/policy-rc.d

ENV KIBANA_VERSION 3.1.1

# Install Required Dependancies
RUN \
  wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add - && \
  add-apt-repository 'deb http://packages.elasticsearch.org/elasticsearch/1.3/debian stable main' && \
  apt-add-repository 'deb http://packages.elasticsearch.org/logstash/1.4/debian stable main' && \
  apt-get -qq update && \
  apt-get -qy install software-properties-common && \
                      openjdk-7-jre-headless && \
                      elasticsearch && \
                      supervisor && \
                      logstash && \
                      nginx && \
                      unzip && \
                      wget

# Install Kibana and Configure Nginx
ADD https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz /opt/
ADD kibana.conf /etc/nginx/sites-available/
RUN \
  mkdir -p /var/www && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  rm /etc/nginx/sites-enabled/default && \
  ln -s /etc/nginx/sites-available/kibana.conf \
    /etc/nginx/sites-enabled/kibana.conf
  cd /opt && tar xzf kibana-$KIBANA_VERSION.tar.gz && \
  ln -s /opt/kibana-$KIBANA_VERSION /var/www/kibana && \
  sed -i 's/9200"/"+ window.location.port/g' /var/www/kibana/config.js && \
  rm kibana-$KIBANA_VERSION.tar.gz && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD supervisord.conf /etc/supervisor/

EXPOSE 80 443

CMD ["/usr/bin/supervisord"]
