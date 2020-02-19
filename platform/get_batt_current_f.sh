#!/bin/sh
# read and print battery current

#print current

function print_current() {
	current=$(($2<<8|$1))
	printf "%d mA" $current
}

print_current $(i2ctransfer -y -f 5 w1@0x0B 0x0A r2)


