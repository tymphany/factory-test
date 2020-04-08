#!/bin/sh
# set gpio state by gpio name
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
confpath=$SHELL_FOLD/conf/gpio.conf

# get line row context from file
# get_lrf <line> <row> <file path>
function get_lrf() {
	awk -v line=$1 -v row=$2 'line==NR { print $row}' $3
}

grep -q $1 $confpath
if [ $? -eq 0 ]; then
	gpioindex=$(grep -n $1 $confpath | cut -d : -f 1)
else
	echo "FAIL: unknow GPIO name"
	exit 1
fi

gpionum=$(get_lrf $gpioindex 2 $confpath)

$BASE_FOLD/platform/set_gpio_f.sh $gpionum $2

if [ $? -eq 0 ]; then 
	echo "OK"
fi
