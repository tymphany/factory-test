echo 254 > /sys/class/leds/ACTION_r/brightness
echo 254 > /sys/class/leds/ACTION_g/brightness
/etc/factory-test/platform/mic_record_init_f.sh
echo 0 > /sys/class/leds/ACTION_r/brightness
echo 0 > /sys/class/leds/ACTION_g/brightness

