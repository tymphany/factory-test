#!/bin/sh
# check Audio read

while true 
do
	pactl info | grep -q vt-64
	if [ $? -eq 0 ]; then
		echo OK
		break
	else
		sleep 1
	fi

done
