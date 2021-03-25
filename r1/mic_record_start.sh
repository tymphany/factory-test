/etc/factory-test/platform/mic_record_f.sh $1
echo 254 > /sys/class/leds/PLAYPAUSE_g/brightness
echo 254 > /sys/class/leds/PLAYPAUSE_r/brightness
#wav file is at: /data/factory-test/mic-3ch.wav
#adb pull /data/factory-test/mic-4ch.wav .\
