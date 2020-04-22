#/bin/sh
# Enter Wifi/BT FTM test mode

insmod /usr/lib/modules/4.14.117/extra/wlan.ko
ifconfig wlan0 up
echo 5 > /sys/module/wlan/parameters/con_mode
ftmdaemon -n -dd  &

