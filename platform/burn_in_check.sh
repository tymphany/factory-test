#!/bin/sh
# check if system need to run burn in mode and start play pinknosic 

if [ -e /data/factory-test/burn_in.conf ]; then 
	echo "Enter Burn in mode !"
	rm /data/factory-test/burn_in.conf
else
	echo "Not burn in"
	exit 0
fi

#play pink noise
while true 
do
	# set max volume
	i2ctransfer -y -f 2 w6@0x3b  0x00 0xa5  0x01 0x00 0x00 0x00

	paplay /data/factory-test/pinknoise.wav
	if [ $? -eq 1 ]; then
		sleep 5s
	fi

done
