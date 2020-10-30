#!/bin/sh

oldbat=color
oldchg=c
bat=red

while (( i==1 ))
do
a=`i2ctransfer -y -f 3 w1@0x38 0x1a r2`
b=`i2ctransfer -y -f 3 w1@0x0b 0x0d r1`
cap=$(($b))
chg=${a: 8}

#chg=e
#cap=9

if [ $cap -ge 95 ]; then
   bat=blue
elif [ $cap -ge 70 ]; then
     bat=green
elif [ $cap -ge 20 ]; then
     bat=orange
elif [ $cap -ge 10 ]; then
     bat=red
else
     bat=danger
fi

#echo "$bat"
if [ $chg == d ]; then
  if [ $oldchg != $chg ]; then
     oldchg=$chg
     #echo "charging"
     if [ $bat == blue ]; then
        adk-message-send "led_start_pattern{pattern:52}"
     elif [ $bat == green ]; then
        adk-message-send "led_start_pattern{pattern:51}"
     elif [ $bat == orange ]; then
        adk-message-send "led_start_pattern{pattern:50}"
     elif [ $bat == red ]; then
        adk-message-send "led_start_pattern{pattern:49}"
     else
        adk-message-send "led_start_pattern{pattern:49}"
     fi
  fi
else
  if [ $oldbat != $bat ]; then
     oldbat=$bat
     if [ $bat == danger ]; then
        adk-message-send "led_start_pattern{pattern:42}"
     else
        adk-message-send "led_start_pattern{pattern:45}"
     fi
  fi
fi

#echo $cap $chg
sleep 1s
done
