#/bin/sh
# Mic record, record 4 channel audio to /data/factory-test/mic-4ch.wav
recordpath=/data/factory-test/mic-4ch.wav
mkdir -p /data/factory-test
if [ -e $recordpath ]; then
	rm $recordpath
fi

tinycap $recordpath -c 4 -t $1
