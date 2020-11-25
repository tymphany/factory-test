#!/bin/sh

echo 0 > /sys/class/leds/Lantern_W1_g/brightness
echo 0 > /sys/class/leds/Lantern_W1_r/brightness
echo 0 > /sys/class/leds/Lantern_W2_b/brightness
echo 0 > /sys/class/leds/Lantern_W2_g/brightness
echo 0 > /sys/class/leds/Lantern_W2_r/brightness
echo 0 > /sys/class/leds/Lantern_W3_b/brightness
echo 0 > /sys/class/leds/Lantern_W3_g/brightness
echo 0 > /sys/class/leds/Lantern_W3_r/brightness

echo "done"
