#!/bin/sh
# for button factory test
keylist=$1
mkdir -p /data/factory
tmpfile1=/data/factory/button_temp1
tmpfile2=/data/factory/button_temp2

if [ -z "$1" ]; then
	echo "FAIL: No Key List input"
	exit 1
else
	echo "key lis path:  $1 "
fi

if [ -z "$2" ]; then
	hexdump -n 48 /dev/input/event1 > $tmpfile1 &
	pid1=$!
	hexdump -n 96 /dev/input/event1 > $tmpfile2 &
	pid2=$!
else
	hexdump -n 48 /dev/input/$2 > $tmpfile1 &
	pid1=$!
	hexdump -n 96 /dev/input/$2 > $tmpfile2 &
	pid2=$!
fi

function clean_up() {
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

function get_keyname() {
	# grep index for targe keyname
	# get_keyname <keycode> <keylist>
	keyname=$(grep $1 $2 | cut -f2 -d' ')
}


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

key1=$(awk 'NR==2 { print $3 }' $tmpfile1)
btn_state1=$(awk 'NR==2 { print $4 }' $tmpfile1)

#echo "key1 : $key1"
#echo "btn_state1 : $btn_state1"

key2=$(awk 'NR==5 { print $3 }' $tmpfile2)
btn_state2=$(awk 'NR==5 { print $4 }' $tmpfile2)

#echo "key2 : $key2"
#echo "btn_state2 : $btn_state2"
if [ -z "$key1" -a -z "$key2" ]; then
	echo "FAIL: No Button press or release event in ${timeout}s!"
	clean_up 1
elif [ -z "$key2" ]; then
	echo "FAIL: Only one key state detected in ${timeout}s!"
	clean_up 1
else
	#print result 1
	get_keyname $key1 $keylist

	if [ -z $keyname ]; then
		keyname=unknown_key
	fi

	if [ $btn_state1 -eq 1 ]; then
		echo "$keyname press"
	elif [ $btn_state1 -eq 0 ]; then
		echo "$keyname release"
	else
		echo "FAIL: $keyname state 1 error"
		clean_up 1
	fi

	# print result 2
	get_keyname $key2 $keylist

	if [ -z $keyname ]; then
		keyname=unknown_key
	fi

	if [ $btn_state2 -eq 1 ]; then
		echo "$keyname press"
	elif [ $btn_state2 -eq 0 ]; then
		echo "$keyname release"
	else
		echo "FAIL: $keyname state 2 error"
		clean_up 1
	fi
fi

clean_up 0

