#!/bin/sh
b=`i2ctransfer -y -f 5 w1@0x0b 0x50 r5`
echo "SafetyAlert:"${b:5}
b=`i2ctransfer -y -f 5 w1@0x0b 0x51 r5`
echo "SafetyStatus:"${b:5}
b=`i2ctransfer -y -f 5 w1@0x0b 0x54 r5`
echo "OperationStatus:"${b:5}
b=`i2ctransfer -y -f 5 w1@0x0b 0x55 r5`
echo "ChargingStatus:"${b:5}
b=`i2ctransfer -y -f 5 w1@0x0b 0x56 r5`
echo "GaugingStatus:"${b:5}
a=`i2ctransfer -y -f 5 w3@0x0b 0x00 0x5a 0x44`
b=`i2ctransfer -y -f 5 w1@0x0b 0x23 r5`
echo "IT Status:"${b:15}
