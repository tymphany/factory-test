
#mic record program start 
echo 254 > /sys/class/leds/ACTION_g/brightness
echo 254 > /sys/class/leds/ACTION_r/brightness
echo 0 > /sys/class/leds/VOL-_g/brightness
echo 0 > /sys/class/leds/VOL-_r/brightness
echo 0 > /sys/class/leds/PLAYPAUSE_g/brightness
echo 0 > /sys/class/leds/PLAYPAUSE_r/brightness
echo 0 > /sys/class/leds/VOL+_g/brightness
echo 0 > /sys/class/leds/VOL+_r/brightness
echo 0 > /sys/class/leds/Mute_g/brightness
echo 0 > /sys/class/leds/Mute_r/brightness

#mic initializatoin start
/etc/factory-test/platform/mic_record_init_f.sh

#mic initializatoin finished 
echo 254 > /sys/class/leds/VOL-_g/brightness
echo 254 > /sys/class/leds/VOL-_r/brightness


