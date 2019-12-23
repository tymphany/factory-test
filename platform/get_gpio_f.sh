#!/bin/sh
# get gpio value
if [ -z "$1" ]; then
    echo "FAIL: No GPIO number input"
    exit 1
fi

gpionum=$1

if [ ! -e /sys/class/gpio/gpio$gpionum/value ]; then
    echo "FAIL: GPIO don't exit"
    exit 1
fi

value=$(cat /sys/class/gpio/gpio$gpionum/value)

echo "PASS: GPIO$gpionum value: $value"
