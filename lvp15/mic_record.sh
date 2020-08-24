#!/bin/sh
# record 3 chnnal Audio to /data/factory-test/mic-3ch.wav
# Mic record, record 4 channel audio to /data/factory-test/mic-3ch.wav

if [ -z "$1" ]; then
	echo "Fail: Please input record time"
	exit 0
fi

recordpath=/data/factory-test/mic-3ch.wav
mkdir -p /data/factory-test
if [ -e $recordpath ]; then
        rm $recordpath
fi

tinycap $recordpath -c 3 -t $1

echo "OK"
