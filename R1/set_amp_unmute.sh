#!/bin/sh
#
# set amp unmute 
# ./set_amp_unmute.sh

i2cset -f -y 3 0x4c 0x03 0x03
sleep 0.1s
status=`i2cget -f -y 3 0x4c 0x03`
echo $status
if [ ${status} = 0x03 ]
then 
    echo OK
else
    echo FAILED
fi
