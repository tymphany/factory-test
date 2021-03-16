#!/bin/sh
# read mic mute state
[ ! -d "/sys/class/gpio/gpio86" ] && echo 86 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio86/direction
echo 0 > /sys/class/gpio/gpio86/value
sleep 1s
#Convert mute state L->H for mute from EVT to DVT
echo 1 > /sys/class/gpio/gpio86/value
echo 0 > /sys/class/gpio/gpio86/value

echo OK

