#! /bin/sh
#
#       NTC_0x48_DETECT
#

echo 47 > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio47/direction
GPIO_STATUS=`cat /sys/class/gpio/gpio47/value`
if [ ${GPIO_STATUS} -eq 0 ]; then
        echo "[Exception Occured]: GPIO TH_DET already stay LOW status"
                echo "[Exception Occured]: Check GPIO TH_DET before detect"
                echo 47 > /sys/class/gpio/unexport
                exit
fi

i2ctransfer -y -f 3 w3@0x48 0x03 0x05 0x00
i2ctransfer -y -f 3 w1@0x48 0x01 r2
sleep 0.5s

GPIO_STATUS=`cat /sys/class/gpio/gpio47/value`
if [ ${GPIO_STATUS} -eq 0 ]; then
        echo "[NTC 0x48 Detect]: OK"
fi

i2ctransfer -y -f 3 w3@0x48 0x03 0x7f 0x00
i2ctransfer -y -f 3 w1@0x48 0x01 r2
sleep 0.5s

GPIO_STATUS=`cat /sys/class/gpio/gpio47/value`
if [ ${GPIO_STATUS} -eq 1 ]; then
        echo "[NTC 0x48 Detect]: Over"
fi

echo 47 > /sys/class/gpio/unexport

