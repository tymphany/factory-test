#!/bin/sh
# Set volume
# support "max" "mute" "0~max"
# ./dsp_test w reg len value
# ./dsp_test r reg len
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

$BASE_FOLD/platform/dsp_test w 0x02C9 0x04 $volumedata
