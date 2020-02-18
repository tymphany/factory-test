#!/bin/sh
# check if system need to run burn in mode and start play pinknosic 

if [ -e /data/factory-test/burn_in.conf ]; then 
	echo "Enter Burn in mode !"
	rm /data/factory-test/burn_in.conf
else
	echo "Not burn in"
	exit 0
fi

# set max volume
mkdir -p /data/factory-test
mkdir -p /run/factory-test
cp -p /data/factory-test/dsp_test /run/factory-test/dsp_test
chmod +x /run/factory-test/dsp_test
/run/factory-test/dsp_test w 0x02C9 0x04 0x01 0x00 0x00 0x00


#play pink noise
while true 
do
	tinyplay /data/factory-test/pinknoise.wav
	if [ $? -eq 1 ]; then
		sleep 5s
	fi

done
