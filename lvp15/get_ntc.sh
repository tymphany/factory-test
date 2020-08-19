#!/bin/sh
# get ntc info base on confige file

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
confpath=$SHELL_FOLD/conf/ntc.conf

# get line row context from file
# get_lrf <line> <row> <file path>
function get_lrf() {
	awk -v line=$1 -v row=$2 'line==NR { print $row}' $3
}

checknum=$(wc -l < $confpath)

while [ $checknum -gt 0 ]
do
	# print item name
	echo "$(get_lrf $checknum 1 $confpath):"
	zonenum=$(get_lrf $checknum 2 $confpath)
	$BASE_FOLD/platform/get_temp.sh $zonenum
	checknum=$(($checknum-1))
done
