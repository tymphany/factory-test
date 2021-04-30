#!/bin/sh
a=`i2ctransfer -y -f 5 w3@0x0b 0x00 0x71 0x00`
b=`i2ctransfer -y -f 5 w1@0x0b 0x23 r33`
b=${b:5}
c1=${b:0:10}
c2=${b:10}
echo $c1
loopn="1"
while [ $(($loopn)) -lt 17 ];
do
temp1=${c1:4}
temp2=${c1:0:4}

b1=$(($temp1*256  + $temp2))
if [ $(($loopn)) -lt 5 ]; then
echo "Cell$loopn Voltage:" $(($b1)) "mV"
elif [  $(($loopn)) -eq 5  ]; then
echo "Bat Pin Vol:" $(($b1)) "mV"
elif [ $(($loopn)) -eq 6  ]; then
echo "Pack Vol:" $(($b1)) "mV"
fi

c1=${c2:0:10}
c2=${c2:10}
loopn=$(($loopn + 1))
done
echo "OK"
