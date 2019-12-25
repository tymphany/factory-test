#!/bin/sh
# get gpio value
errcode=22
if [ -z "$1" ]; then
    echo "FAIL: No GPIO number input"
    exit $errcode
fi

gpionum=$1

if [ ! -e /sys/class/gpio/gpio$gpionum/value ]; then
    echo "FAIL: GPIO don't exit"
    exit $errcode
fi

value=$(cat /sys/class/gpio/gpio$gpionum/value)

echo "PASS: GPIO$gpionum value: $value"
exit $value

