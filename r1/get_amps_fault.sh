#!/bin/sh

#3 CH1_DC_1 R 0 left channel DC fault
#2 CH2_DC_1 R 0 right channel DC fault
#1 CH1_OC_I R 0 left channel over current fault
#0 CH2_OC_I R 0 right channel over current fault

b1=`i2ctransfer -y -f 5 w1@0x4d 0x70 r1`
b2=`i2ctransfer -y -f 5 w1@0x4d 0x70 r1`
fault1=$(($b1))
fault2=$(($b2))

echo "amp1 fault: $fault1" 
echo "amp2 fault: $fault2" 



