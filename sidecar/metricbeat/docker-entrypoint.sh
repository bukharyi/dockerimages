#!/bin/bash
. /beats/configure-beats.sh
/beats/metricbeat/metricbeat  modules enable $ES_MODULES -c /beats/metricbeat/metricbeat.yml
/beats/metricbeat/import_vis.sh -url http://$ES_HOST -index $ES_INDEX -modules $ES_MODULES
/beats/metricbeat/metricbeat -e -c /beats/metricbeat/metricbeat.yml

