#!/bin/bash

#	doc monitor - host script
#	script for syncing local and remote directory

source /opt/doc-monitor/doc-monitor-config.sh

while true
do
	PREV_MODTIME=`cat $PREV_MODTIME_FILE`
	NEW_MODTIME=`find ~/Documents/ -type f -printf "%T@\n" | sort | tail -1`

	if [ $PREV_MODTIME != $NEW_MODTIME ]
	then
	        echo $NEW_MODTIME > $PREV_MODTIME_FILE
		echo "New modtime written"
	fi
	sleep $FREQUENCY
done
