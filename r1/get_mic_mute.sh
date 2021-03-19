#!/bin/sh
# read mic mute state
[ ! -d "/sys/class/gpio/gpio35" ] && echo 35 > /sys/class/gpio/export
cat /sys/class/gpio/gpio35/value
