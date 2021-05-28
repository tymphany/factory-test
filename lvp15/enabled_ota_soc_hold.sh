#!/bin/sh
#set high cypress pin

i2cset -f -y 2 0x08 0x0d 1
sleep 1
while true
do
	HOLD=`i2cget -f -y 2 0x08 0x0d`
	if [ $HOLD == 0x01 ];then
		break
	else
		i2cset -f -y 2 0x08 0x0d 1
	fi
	sleep 1
done
echo "OK"
