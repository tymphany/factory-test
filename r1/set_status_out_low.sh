#!/bin/sh
# read mic mute state
[ ! -d "/sys/class/gpio/gpio116" ] && echo 116 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio116/direction
echo 0 > /sys/class/gpio/gpio116/value
echo OK

