#!/bin/bash
## VERIFY THIS
if [ -z "$ES_MODULES" ]; then
	echo >&2 'ERROR:ES_MODULES  is uninitialized'
	exit 1
fi


###CONFIGURE metricbeat.yml
echo "DOCKER:- updating configurtion file /beats/metricbeats/metricbeat.yml"
/bin/sed -i "
s/ES_HOST/${ES_HOST}/g
s/ES_USERNAME/${ES_USERNAME}/g
s/ES_PASSWORD/${ES_PASSWORD}/g
s/ES_INDEX/${ES_INDEX}/g" /beats/metricbeat/metricbeat.yml

echo "DOCKER:- updating configuration file /beats/metricbeats/metricbeat.template.json"
/bin/sed -i "
s/ES_INDEX/${ES_INDEX}/g
" /beats/metricbeat/metricbeat.template.json
