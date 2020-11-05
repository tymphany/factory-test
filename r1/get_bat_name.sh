#!/bin/sh

a=`i2ctransfer -y -f 5 w1@0x0b 0x21 r11`

a=${a//0x/}
a=${a// /}

function hex2string () {
  I=0
  while [ $I -lt ${#1} ];
  do
    echo -en "\x"${1:$I:2}
    let "I += 2"
  done
}
hex2string $a
echo 

