#!/bin/sh
#set LED by name, base on config file
# set_led.sh <LED name>  <r brightness>  <g brightness> <b brightness>
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
confpath=$SHELL_FOLD/conf/led.conf

# get line row context from file
# get_lrf <line> <row> <file path>
function get_lrf() {
	awk -v line=$1 -v row=$2 'line==NR { print $row}' $3
}

grep -q $1 $confpath
if [ $? -eq 0 ]; then
	ledconfline=$(grep -n $1 $confpath | cut -d : -f 1)
else
	echo "FAIL: unkown LED name !"
	exit 1
fi

lednum=$(get_lrf $ledconfline 2 $confpath)

$BASE_FOLD/platform/led_f_ctrl.sh $lednum $2 $3 $4
exit $?
