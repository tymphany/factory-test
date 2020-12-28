#!/bin/sh
# read mic mute state
[ ! -d "/sys/class/gpio/gpio48" ] && echo 48 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio48/direction
echo 0 > /sys/class/gpio/gpio48/value
echo 1 > /sys/class/gpio/gpio48/value
echo OK

