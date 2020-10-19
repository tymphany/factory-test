# contrl LED with LED name.
#                 $1             $2
# led_f_ctrl.sh <LED name>  <R brightness>

if [[ $# -lt 2 ]]; then
	echo "FAIL: lack parameter"
	exit 1
fi

if [[ $# -gt 2 ]]; then
	echo "FAIL: too much parameter"
	exit 1
fi

if [[ $2 -gt 255 ]] || [[ $2 -lt 0 ]]
then
	echo "FAIL: Wrong Brightness Value"
	exit 1
else
	echo $2 > /sys/class/leds/$1/brightness
fi
