#! /bin/sh

if [[ $# -lt 4 ]]; then
	echo "FAIL: lack parameter"
	exit 1
fi

if [[ $# -gt 4 ]]; then
	echo "FAIL: too much parameter"
	exit 1
fi

id_Led_max=`ls /sys/class/leds | grep "_r" | wc -l`

if [[ $2 -gt 255 ]] || [[ $2 -lt 0 ]]\
|| [[ $3 -gt 255 ]] || [[ $3 -lt 0 ]]\
|| [[ $4 -gt 255 ]] || [[ $4 -lt 0 ]]
then
	echo "FAIL: Wrong Brightness Number"
	exit 1
else
	if [[ $1 == "all" ]]; then
		for i in `seq $id_Led_max`
		do
			echo $2 > /sys/class/leds/ledsec$i\_r/brightness
			echo $3 > /sys/class/leds/ledsec$i\_g/brightness
			echo $4 > /sys/class/leds/ledsec$i\_b/brightness
		done
	else
		if [[ $1 -lt 1 ]] || [[ $1 -gt $id_Led_max ]]; then
			echo "FAIL: Led_id Wrong, Need to less than $(($id_Led_max+1))"
			exit 1
		else
			echo $2 > /sys/class/leds/ledsec$1\_r/brightness
			echo $3 > /sys/class/leds/ledsec$1\_g/brightness
			echo $4 > /sys/class/leds/ledsec$1\_b/brightness
		fi
	fi
fi
