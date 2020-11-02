#/bin/sh
pin_status=`cat /sys/devices/platform/soc/1000000.pinctrl/gpiochip0/gpio/gpio78/value`
if [ $pin_status -eq 0 ];then
   echo "Status : 0 (Mute)"
else
   echo "Status : 1 (Un-mute)"
fi
exit 0