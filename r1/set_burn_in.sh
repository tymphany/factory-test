#!/bin/sh
# Set system to burn in mode, and run burn in proce once when reboot.
# ./set_burn_in.sh max
# $1 is times

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

echo 0   > /sys/class/leds/CONNECT_g/brightness
echo 255 > /sys/class/leds/CONNECT_b/brightness

echo $1 > $SHELL_FOLD/conf/burn_in.conf
mkdir -p /data/factory-test
cp -p $SHELL_FOLD/conf/burn_in.conf /data/factory-test/burn_in.conf
cp -p $BASE_FOLD/platform/data/pinknoise.wav /data/factory-test/pinknoise.wav
echo max > $SHELL_FOLD/conf/burn_in.conf

if [ $? -eq 0 ]; then 
	echo "OK, so far everything is OK"
fi

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

echo "Begin burn in test. We will play pink noise track 1 minute long for $times cycles"

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
adk-message-send 'audio_volume_set {value : 0.4}'

#play pink noise
while true 
do
	if [ $times != "max" ];then
		times=$((times-1))
		if [ $times -lt 0 ]; then
			echo "Burning test is completed."
			echo 255 > /sys/class/leds/CONNECT_g/brightness
			echo 0   > /sys/class/leds/CONNECT_b/brightness
			exit 0
		fi
	fi		
	
	# set DSP volume
	#  i2ctransfer -y -f 2 w6@0x3b 0x00 0xa3 0x01 0x00 0x00 0x00
	echo "Playing pink noise now at volume 0.4. $times Cycles left."
	/etc/factory-test/r1/play_file.sh /data/factory-test/pinknoise.wav
	if [ $? -eq 1 ]; then
		sleep 5s
	fi

done


