#!/bin/sh
#
# set amp mute 
# ./set_amp_mute.sh

i2cset -f -y 3 0x4c 0x03 0x08
sleep 0.1s
status=`i2cget -f -y 3 0x4c 0x03`
#echo $status
if [ ${status} = 0x08 ]
then 
    echo OK
else
    echo FAILED
fi
