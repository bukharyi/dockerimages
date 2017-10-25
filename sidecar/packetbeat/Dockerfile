#LAST MODIFIED 28/2/2017
FROM debian 
MAINTAINER Bukhary Ikhwan <ikhwan.ismail@mimos.my>

ENV ES_HOST '"10.1.81.18:9200", "10.1.81.20:9200", "10.1.81.21:9200","10.1.81.22:9200"'
ENV ES_INDEX 'defaultnamespace-packetbeat'
ENV ES_USERNAME ''
ENV ES_PASSWORD ''

RUN mkdir /beats
RUN mkdir /beats/packetbeat/ 
COPY beats/packetbeat-5.6.2-linux-x86_64.tar.gz /tmp
RUN tar xvf /tmp/packetbeat-5.6.2-linux-x86_64.tar.gz -C /beats/packetbeat --strip-components=1
RUN rm /tmp/*
COPY packetbeat.yml /beats/packetbeat/packetbeat.yml
copy packetbeat.template.json /beats/packetbeat/packetbeat.template.json

###COPY ENTRYPOINT
ADD configure-beats.sh /beats/
ADD docker-entrypoint.sh /usr/local/bin/
RUN chmod 700 /beats/configure-beats.sh /usr/local/bin/docker-entrypoint.sh
RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat

ENTRYPOINT ["docker-entrypoint.sh"]
#ENTRYPOINT ["/bin/bash"]
