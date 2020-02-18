#!/bin/sh
# check PA fault state
#confpath=/data/factory/conf/pa_fault.conf
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
confpath=$SHELL_FOLD/conf/pa_fault.conf
panum=$(wc -l < $confpath)

# get line row context from file
# get_lrf <line> <row> <file path>
function get_lrf() {
	awk -v line=$1 -v row=$2 'line==NR { print $row}' $3
}

while [ $panum -gt 0 ]
do
	gpionum=$(get_lrf $panum 1 $confpath)
	paname=$(get_lrf $panum 2 $confpath)

	$BASE_FOLD/platform/get_gpio_f.sh $gpionum
	result=$?
	if [ $result -lt 2 ]; then
		echo "PASS: $paname state: $result "
	else
		echo "FAIL: $paname read error <$result>"
	fi
	panum=$(($panum-1))
done


