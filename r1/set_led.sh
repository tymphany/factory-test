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
	if 	[[ $1 == "ACTION_g" ]] || [[ $1 == "ACTION_r" ]] || \
		[[ $1 == "CONNECT_b" ]] || [[ $1 == "CONNECT_g" ]] || [[ $1 == "CONNECT_r" ]] || \
		[[ $1 == "Lantern_g" ]] || [[ $1 == "Lantern_r" ]] || \
		[[ $1 == "PLAYPAUSE_g" ]] || [[ $1 == "PLAYPAUSE_r" ]] || \
		[[ $1 == "USB_r" ]] || \
		[[ $1 == "VOL+_g" ]] || [[ $1 == "VOL+_r" ]] || \
		[[ $1 == "VOL-_g" ]] || [[ $1 == "VOL-_r" ]] || \
		[[ $1 == "Mute_g" ]] || [[ $1 == "Mute_r" ]] || \
		[[ $1 == "Lantern_W1_g" ]] || [[ $1 == "Lantern_W1_r" ]] || \
		[[ $1 == "Lantern_W2_b" ]] || [[ $1 == "Lantern_W2_g" ]] || [[ $1 == "Lantern_W2_r" ]] || \
		[[ $1 == "Lantern_W3_b" ]] || [[ $1 == "Lantern_W3_g" ]] || [[ $1 == "Lantern_W3_r" ]] || \
		[[ $1 == "Lantern_led1_r" ]] || [[ $1 == "Lantern_led2_r" ]] || \
		[[ $1 == "Lantern_led3_r" ]] || [[ $1 == "Lantern_led4_r" ]] || [[ $1 == "Lantern_led5_r" ]] || \
		[[ $1 == "Lantern_led6_r" ]] || [[ $1 == "Lantern_led7_r" ]] || [[ $1 == "Lantern_led8_r" ]] || \
		[[ $1 == "Lantern_led1_g" ]] || [[ $1 == "Lantern_led2_g" ]] || \
		[[ $1 == "Lantern_led3_g" ]] || [[ $1 == "Lantern_led4_g" ]] || [[ $1 == "Lantern_led5_g" ]] || \
		[[ $1 == "Lantern_led6_g" ]] || [[ $1 == "Lantern_led7_g" ]] || [[ $1 == "Lantern_led8_g" ]] || \
		[[ $1 == "Lantern_led1_b" ]] || [[ $1 == "Lantern_led2_b" ]] || \
		[[ $1 == "Lantern_led3_b" ]] || [[ $1 == "Lantern_led4_b" ]] || [[ $1 == "Lantern_led5_b" ]] || \
		[[ $1 == "Lantern_led6_b" ]] || [[ $1 == "Lantern_led7_b" ]] || [[ $1 == "Lantern_led8_b" ]]
	then
		echo "OK"
		echo $2 > /sys/class/leds/$1/brightness
	else
		echo "FAIL: Wrong LED name"
	fi
fi
