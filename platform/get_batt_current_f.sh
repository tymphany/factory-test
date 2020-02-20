#!/bin/sh
# read and print battery current

#print current

function print_current() {
	current=$(($2<<8|$1))
	if [ $current -le 32768 ]; then
		printf "%dmA\n" $current
	else
		current=$(($current-0x10000))
		printf "%dmA\n" $current
	fi
}

print_current $(i2ctransfer -y -f 5 w1@0x0B 0x0A r2)


