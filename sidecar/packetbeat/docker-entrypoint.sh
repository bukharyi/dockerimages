#!/bin/bash
. /beats/configure-beats.sh
/beats/packetbeat/packetbeat -e -c /beats/packetbeat/packetbeat.yml

