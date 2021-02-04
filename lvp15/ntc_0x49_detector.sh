#! /bin/sh
#
# NTC_0x49_DETECT
#

killall ntc_manager

low_inte="0x05"
low_deci="0x00"
high_inte="0x7a"
high_deci="0x80"

out=`i2ctransfer -y -f 3 w3@0x49 0x02 ${low_inte} ${low_deci}`
out=`i2ctransfer -y -f 3 w3@0x49 0x03 ${high_inte} ${high_deci}`
out=`i2ctransfer -y -f 3 w1@0x49 0x01 r2`

low_ret=`i2ctransfer -y -f 3 w1@0x49 0x02 r2`
high_ret=`i2ctransfer -y -f 3 w1@0x49 0x03 r2`

if [[ ${low_ret% *} == ${low_inte} ]] && [[ ${low_ret#* } == ${low_deci} ]] && \
	[[ ${high_ret% *} == ${high_inte} ]] && [[ ${high_ret#* } == ${high_deci} ]];then
	echo "OK"
else
	echo "Failed"
fi
#/usr/bin/ntc_manager &
