#!/bin/sh
# for GPIO set value
gpionum=$1
value=$2

if [ -z $1 ]; then
	echo "FAIL: Please input GPIO Number"
	exit 1
elif [ -z $2 ]; then
	echo "FAIL Please input GPIO value"
	exit 1
fi

gpiopath=/sys/class/gpio/gpio$gpionum/value

if [ ! -e $gpiopath ]; then
	echo "FAIL: GPIO$gpionum don't exit!"
	exit 1
fi

if [ $value -lt 2 ]; then
	echo $value > $gpiopath
	echo "PASS: set GPIO$gpionum to $2 success"
	exit 0
else
	echo "FAIL: GPIO value out of range!"
	exit 1
fi
