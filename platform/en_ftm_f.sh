#/bin/sh
# Enter Wifi/BT FTM test mode

insmod /usr/lib/modules/4.14.117-perf/extra/wlan.ko
ifconfig wlan0 up
while true 
do 
	ifconfig | grep wlan0
	if [ $? -eq 0 ]; then
		break
	fi
	sleep 2
	ifconfig wlan0 up
done
echo 5 > /sys/module/wlan/parameters/con_mode
ftmdaemon -n -dd  

