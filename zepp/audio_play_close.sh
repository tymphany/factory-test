#!/bin/sh
# close audio play

pkill -f "audio_play"

if [ $? -eq 0 ]; then 
	echo "OK"
fi
