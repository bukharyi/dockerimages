#!/bin/bash
## VERIFY THIS
#if [ -z "$_ES_HOST" -a -z "$_ES_INDEX" ]; then
#			echo >&2 'ERROR:ES_HOST and or ES_INDEX is uninitialized'
#			exit 1
#fi


###CONFIGURE packetbeat.yml
echo "updating configurtion file /beats/packetbeat/packetbeat.yml"
/bin/sed -i "
s/ES_HOST/${ES_HOST}/g
s/ES_USERNAME/${ES_USERNAME}/g
s/ES_PASSWORD/${ES_PASSWORD}/g
s/ES_INDEX/${ES_INDEX}/g" /beats/packetbeat/packetbeat.yml

echo "updating configuration file /beats/packetbeat/packetbeat.template.json"
/bin/sed -i "
s/ES_INDEX/${ES_INDEX}/g
" /beats/packetbeat/packetbeat.template.json
