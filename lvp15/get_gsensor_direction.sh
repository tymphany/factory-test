#
#    Gsensor Direction Get
#
#! /bin/sh
modprobe -r st_lsm6dso_i2c
modprobe st_lsm6dso_i2c
value=0
for i in `seq 5`
do
	tmp=`cat /sys/bus/iio/devices/iio\:device2/in_accel_z_raw`
	value=$(( ${value} + ${tmp} ))
done
value=$(( ${value} / 500 ))
if [[  ${value} -lt 67 ]]; then
	echo "[GSENSOR STATE]: Heel"
else
	echo "[GSENSOR STATE]: Horizontal"
fi
