#!/bin/sh
# read and print battery capacity

#print capacity
function print_capacity() {
	capacity=$(($2<<8|$1))
	printf "%u%%\n" $capacity
}

print_capacity $(i2ctransfer -y -f 5 w1@0x0B 0x0D r2)

