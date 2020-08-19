#!/bin/sh
# read volume data from dsp and check volume.conf for volume value

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
confpath=$SHELL_FOLD/conf/volume.conf

#get line context form file
# get_lf <line> <file path>
function get_lf() {
	awk -v line=$1 'line==NR { print $0}' $2
}
 
volumedata=$(i2ctransfer -y -f 2 w2@0x3b 0x00 0xa5 r4)
volumedata=$(echo $volumedata | tr [a-z] [A-Z])

maxvolstep=$(wc -l < $confpath)

i=1
while [ $i -le $maxvolstep ]
do
	tabledata=$(get_lf $i $confpath)
	tabledata=$(echo $tabledata | tr [a-z] [A-Z])
	if [ "$volumedata" == "$tabledata" ]; then
		volumevalue=$(($i-1))
		echo "$volumevalue"
		exit 0
	fi
	i=$(($i+1))
done

echo "FAIL: unkown volume value"
