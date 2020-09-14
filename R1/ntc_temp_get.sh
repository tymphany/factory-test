#! /bin/sh

#
#	NTC Temperature Get
#
#	./ntc_temp_get.sh <TemperatureSensor I2C Address>
#

if [[ -z $1 ]]; then
	echo "Arguments Lack"
	exit
fi

data_str=`i2ctransfer -y -f 5 w1@$1 0x00 r2`

inte=${data_str% *}
inte=`printf %d ${inte}`

deci=${data_str#* }
deci=${deci%0*}
deci=`printf %d ${deci}`
deci=`awk -v x=6.25 -v y=$deci 'BEGIN{printf "%d\n",x*y}'`

total=`printf "%d.%d" ${inte} ${deci}`
echo "Temperature_Sensor_Address:$1   Temp:${total}"
