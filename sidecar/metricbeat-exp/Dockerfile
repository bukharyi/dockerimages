#LAST MODIFIED 28/2/2017
FROM debian 
MAINTAINER Bukhary Ikhwan <ikhwan.ismail@mimos.my>
ENV ES_MODULES ''
ENV ES_HOST '"10.1.81.18:9200", "10.1.81.20:9200", "10.1.81.21:9200","10.1.81.22:9200"'
ENV ES_INDEX 'default_namespace-metricbeat'
ENV ES_USERNAME ''
ENV ES_PASSWORD ''

RUN mkdir /beats
RUN mkdir /beats/metricbeat/ 
COPY beats/metricbeat-6.0.0-beta2-linux-x86_64.tar.gz /tmp
COPY dashboards /beats/metricbeat/dashboards
COPY import_vis.sh /beats/metricbeat/import_vis.sh
RUN apt-get update; apt-get -y install curl
RUN tar xvf /tmp/metricbeat-6.0.0-beta2-linux-x86_64.tar.gz -C /beats/metricbeat --strip-components=1
RUN mv /beats/metricbeat/modules.d/system.yml /beats/metricbeat/modules.d/system.yml.disabled
RUN rm /tmp/*
COPY metricbeat.yml /beats/metricbeat/metricbeat.yml
copy metricbeat.template.json /beats/metricbeat/metricbeat.template.json

###COPY ENTRYPOINT
ADD configure-beats.sh /beats/
ADD docker-entrypoint.sh /usr/local/bin/
RUN chmod 700 /beats/configure-beats.sh /usr/local/bin/docker-entrypoint.sh
RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat

ENTRYPOINT ["docker-entrypoint.sh"]
#ENTRYPOINT ["/bin/bash"]
