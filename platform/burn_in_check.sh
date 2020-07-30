#!/bin/sh
# check if system need to run burn in mode and start play pinknosic 
times=0
if [ -e /data/factory-test/burn_in.conf ]; then 
	echo "Enter Burn in mode !"
        times=`cat /data/factory-test/burn_in.conf`
	rm /data/factory-test/burn_in.conf
else
	echo "Not burn in"
	exit 0
fi

# check audio ready
while true 
do
	pactl info | grep -q vt-64
	if [ $? -eq 0 ]; then
		break
	else
		sleep 1
	fi
done

# pulse audio unmute
adk-message-send 'audio_mute_set {mute : false}'
# set pulse audio max volume
adk-message-send 'audio_volume_set {value : 1}'

#play pink noise
while true 
do
	if [ $times != "max" ];then
		times=$((times-1))
		if [ $times -lt 0 ]; then
			exit 0
		fi
	fi		
	
	# set DSP max volume
	i2ctransfer -y -f 2 w6@0x3b 0x00 0xa3 0x01 0x00 0x00 0x00
	paplay /data/factory-test/pinknoise.wav
	if [ $? -eq 1 ]; then
		sleep 5s
	fi

done
