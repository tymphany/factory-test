#!/bin/sh
# light power led

a=`i2ctransfer -y -f 3 w1@0x38 0x1a r2`
b=d
c=1
d=1
i=1

while (( i==1 ))
do
a=`i2ctransfer -y -f 3 w1@0x38 0x1a r2`
if [ "${a: 8}" = "$b" ]; then
   if [ $c == 1 ]; then
      echo "= ${a: 8} $c $d"
      adk-message-send "led_start_pattern{pattern:42}"
      d=1
      c=0
      echo " $c $d"
      fi
else
   if [ $d == 1 ]; then
      echo "!= ${a: 8} $c $d"
      adk-message-send "led_start_pattern{pattern:46}"
      d=0
      c=1
      fi
fi
echo "charger check ${a: 8} "
sleep 3s
done




