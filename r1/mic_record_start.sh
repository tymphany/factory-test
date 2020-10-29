echo 254 > /sys/class/leds/ACTION_r/brightness
/etc/factory-test/platform/mic_record_init_f.sh
echo 0 > /sys/class/leds/ACTION_r/brightness
echo 254 > /sys/class/leds/ACTION_g/brightness
/etc/factory-test/platform/mic_record_f.sh $1
echo 0 > /sys/class/leds/ACTION_g/brightness
#wav file is at: /data/factory-test/mic-3ch.wav
#adb pull /data/factory-test/mic-4ch.wav .\