#!/bin/bash

source /opt/doc-monitor/doc-monitor-config.sh

if [[ -z $1 ]];
then
	echo "Successfully deleted nothing";
	return;
fi

if [[ -f $NODE ]];
then 
	rm $NODE
	echo $NODE "is gone forever"
	echo `date +"%s"`	$1 >> $OUT;
else
	if [[ -d $NODE ]];
	then
		PS3="Really delete $NODE? (Enter #): "
		select yn in "Yes" "No"; do
    		case $yn in
    		    Yes ) rm -rf $NODE; echo `date +"%s"`	$1/ >> $OUT; break;;
   		    No ) return;;
		esac;
		done;
	else
		echo "$NODE not found"
	fi
fi
