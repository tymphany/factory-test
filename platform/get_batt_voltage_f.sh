#!/bin/sh
# read and print battery voltage

#print voltage
function print_voltage() {
	voltage=$(($2<<8|$1))
	printf "%u mV" $voltage
}

print_voltage $(i2ctransfer -y -f 5 w1@0x0B 0x09 r2)

