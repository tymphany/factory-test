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

if [[ $1 == "all" ]]; then
	lednum=$(wc -l < $confpath)
	i=1
	while [ $i -le $lednum ]
	do
		leddrv=$(get_lrf $i 2 $confpath)
		$BASE_FOLD/platform/led_f_ctrl.sh $leddrv $2 $3 $4
		i=$(($i+1))
	done

	if [ $? -eq 0 ]; then 
		echo "OK"
	fi
else
	grep -q $1 $confpath
	if [ $? -eq 0 ]; then
		ledconfline=$(grep -wn $1 $confpath | cut -d : -f 1)
	else
		echo "FAIL: unkown LED name !"
		exit 1
	fi

	leddrv=$(get_lrf $ledconfline 2 $confpath)

	$BASE_FOLD/platform/led_f_ctrl.sh $leddrv $2 $3 $4

	if [ $? -eq 0 ]; then 
		echo "OK"
	fi
fi
