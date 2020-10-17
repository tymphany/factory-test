#!/bin/sh
# set volume range 0 - 1.0
if [ $1 -ge 2 ]
then
	echo "volume range 0 to 1.0"
else
	adk-message-send "audio_volume_set {value : $1 }"
	echo "OK"
fi
