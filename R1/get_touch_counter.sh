#!/bin/sh
# get cypress capsense button counter
# $1 is the value high 8bit register addr
begin_addr=0x00

if [ -z "$1" ]; then
        echo "FAIL: Please input reg addr! examle: get_touch_counter.sh 0x00"
        exit 0
fi

if [ $1 == "mute" ]
then
   begin_addr=0x00
   echo "mute counter"
elif [ $1 == "mufunction" ]
then
   begin_addr=0x02
   echo "mufunction counter"
elif [ $1 == "pair" ]
then
   begin_addr=0x04
   echo "pair counter"
else
   echo "FAIL: not this touch widget, support mute, mufunction, pair"
   exit 0
fi

function getVH()
{
    i2cget -y -f 2 0x08 $1
}

function getVL()
{
    i2cget -y -f 2 0x08 $1
}

low8bit=`expr $(($begin_addr)) + 1`

VH=`getVH $begin_addr`
VL=`getVL $low8bit`

value=`expr $(($VH<<8)) + $(($VL))`
echo $value
