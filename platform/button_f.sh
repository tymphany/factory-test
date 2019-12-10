#!/bin/sh
# for button factory test
keycode=$1
tmpfile1=/data/button_temp1
tmpfile2=/data/button_temp2

if [ -z "$1" ]; then
	echo "FAIL: No Keycode input"
	exit 1
else
	echo "test keycode : $1 "
fi

hexdump -n 48 /dev/input/event1 > $tmpfile1 &
pid1=$!
hexdump -n 96 /dev/input/event1 > $tmpfile2 &
pid2=$!

function clean_up {
	# perform program exit housekeeping
	rm -f $tmpfile1
	rm -f $tmpfile2

	process1=$(ps | grep hexdump | grep $pid1 | wc -l)
	if [ $process1 -eq 1 ]; then
		kill $pid1
	fi
	process2=$(ps | grep hexdump | grep $pid2 | wc -l)
	if [ $process2 -eq 1 ]; then
		kill $pid2
	fi
	exit $1
}

trap clean_up 1 SIGHUP SIGINT SIGTERM



timeout=10
i=0
timeout_ms=$((1000*$timeout/2))
echo "Please press and release  button within $timeout seconds!"

while [ $i -lt $timeout_ms ]
do
	process2=$(ps | grep hexdump | grep $pid2 | wc -l)
	if [ $process2 -eq 0 ]; then 
		break
	fi
	sleep 0.05
	i=$(($i+50))
done

key1=$(awk 'NR==1 { getline ; print $3 }' $tmpfile1)
btn_state1=$(awk 'NR==1 { getline ; print $4 }' $tmpfile1)

#echo "key1 : $key1"
#echo "btn_state1 : $btn_state1"

key2=$(awk 'NR==4 { getline ; print $3 }' $tmpfile2)
btn_state2=$(awk 'NR==4 { getline ; print $4 }' $tmpfile2)

#echo "key2 : $key2"
#echo "btn_state2 : $btn_state2"

if [ $1 -eq $key1 -a $btn_state1 -eq 1 ]; then
	if [ $1 -eq $key2 -a $btn_state2 -eq 0 ]; then
		echo "PASS: Button press or release event detected in ${timeout}s!"
		clean_up 0
	else
		echo "FAIL: Can't detect Button release event in ${timeout}s!"
	fi
else
	if [ -z "$key1" -a -z "$key2" ]; then
		echo "FAIL: No Button press or release event in ${timeout}s!"
	elif [ $1 -eq $key1 -a $btn_state1 -eq 0 ]; then
		echo "FAIL: Can't detect Button press event in ${timeout}s!"
	else
		echo "FAIL: Wrong Button press or release in ${timeout}s!"
	fi
fi

clean_up 1

