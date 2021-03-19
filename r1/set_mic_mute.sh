#!/bin/sh
# read mic mute state
[ ! -d "/sys/class/gpio/gpio86" ] && echo 86 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio86/direction
echo 0 > /sys/class/gpio/gpio86/value
echo 1 > /sys/class/gpio/gpio86/value
echo OK

