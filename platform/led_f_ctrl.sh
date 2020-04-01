#! /bin/sh
# contrl LED with LED name. 
#                 $1             $2             $3            $4
# led_f_ctrl.sh <LED name>  <R brightness> <G brightness> <B brightness>

if [[ $# -lt 4 ]]; then
	echo "FAIL: lack parameter"
	exit 1
fi

if [[ $# -gt 4 ]]; then
	echo "FAIL: too much parameter"
	exit 1
fi

if [[ $2 -gt 255 ]] || [[ $2 -lt 0 ]]\
|| [[ $3 -gt 255 ]] || [[ $3 -lt 0 ]]\
|| [[ $4 -gt 255 ]] || [[ $4 -lt 0 ]]
then
	echo "FAIL: Wrong Brightness Number"
	exit 1
else
	echo $2 > /sys/class/leds/$1\_r/brightness
	echo $3 > /sys/class/leds/$1\_g/brightness
	echo $4 > /sys/class/leds/$1\_b/brightness
fi
