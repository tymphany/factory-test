#!/bin/sh
# get thermal value for target thermal zone

if [ -z "$1" ]; then
echo "FAIL: No Thermal zone number input !"
exit 1
fi

if [ ! -e /sys/devices/virtual/thermal/thermal_zone$1/temp ]; then
echo "FAIL: thermalzone$1 don't exit !"
exit 1
fi

cat /sys/devices/virtual/thermal/thermal_zone$1/type
cat /sys/devices/virtual/thermal/thermal_zone$1/temp
