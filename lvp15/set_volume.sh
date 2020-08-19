#!/bin/sh
# Set volume
# support "max" "mute" "0~max"
#                      [chip addr]  [reg addr]     [data]
# i2ctransfer -y -f 2 w6@0xXX       0xXX 0xXX      0xXX 0xXX 0xXX 0xXX
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
confpath=$SHELL_FOLD/conf/volume.conf

#get line context form file
# get_lf <line> <file path>
function get_lf() {
	awk -v line=$1 'line==NR { print $0}' $2
}

maxvol=$(wc -l < $confpath)

if [ $1 == "mute" ]; then
	vol=1
elif [ $1 == "max" ]; then
	vol=$maxvol
else
	if [ $1 -lt $maxvol ]; then
		vol=$(($1+1))
	else
		echo "FAIL: volume out of range!"
		exit 1
	fi
fi

volumedata=$(get_lf $vol $confpath)

i2ctransfer -y -f 2 w6@0x3b 0x00 0xa3  $volumedata

if [ $? -eq 0 ]; then 
	echo "OK"
fi
