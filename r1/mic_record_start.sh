
# Mic record, record 4 channel audio to /data/factory-test/mic-4ch.wav
recordpath=/data/factory-test/mic-4ch.wav
mkdir -p /data/factory-test
if [ -e $recordpath ]; then
	rm $recordpath
fi

#start mic recording
echo 254 > /sys/class/leds/PLAYPAUSE_g/brightness
echo 254 > /sys/class/leds/PLAYPAUSE_r/brightness

if [ ! $1 ]
then
	echo "recording time is null"
else
	echo "recording time is $1"
	tinycap $recordpath -c 4 -t $1
fi

#finish mic recording
echo 254 > /sys/class/leds/VOL+_g/brightness
echo 254 > /sys/class/leds/VOL+_r/brightness

#wav file is at: /data/factory-test/mic-3ch.wav
#adb pull /data/factory-test/mic-4ch.wav .\
