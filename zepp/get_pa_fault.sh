#!/bin/sh
# check PA fault state
#confpath=/data/factory/conf/pa_fault.conf
confpath=./conf/pa_fault.conf
panum=$(wc -l < $confpath)

# get line row context from file
# get_lrf <line> <row> <file path>
function get_lrf() {
	awk -v line=$1 row=$2 'line==NR { print $row}' $3
}

while [ $panum -gt 0 ]
do
	gpionum=$(get_lrf $panum 1 $confpath)
	paname=$(get_lrf $panum 2 $confpath)

	./get_gpio_f.sh $gpionum
	result=$?
	if [ $reslut -lt 2 ]; then
		echo "PASS: $paname state: $result "
	else
		echo "FAIL: $paname read error <$result>"
	fi
	panum=$(($panum-1))
done


