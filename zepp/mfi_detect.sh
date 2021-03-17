#!/bin/sh
# for I2C inventory check
# input check list formal as:
#   <Bus Number>   <Address>  <Component Name>
# exp:
#i2c-2 20 AMP-MA12070-1
#
#NOTICE: I2C address using 7bit more and number as hex form !!!
SHELL_FOLD=$(dirname $0)
tmp=$SHELL_FOLD/conf/mfi.conf
checklist=$tmp
mkdir -p /run/factory

if [ -z "$tmp" ]; then
	echo "FAIL: No Checklist input!"
elif [ ! -f $tmp ]; then 
	echo "FAIL: Input file don't exit!"
fi

# get line row context from file
# get_lrf <line> <row> <file path>
function get_lrf() {
	awk -v line=$1 -v row=$2 'line==NR { print $row}' $3
}
# detect single I2C addres result
# det_addr <I2c bus number> <I2C address>
function check_i2c_addr() {

	detfile=/run/factory/det-i2c
	i2cnum=$(get_lrf $1 1 $2 | cut -c 5 )
	i2caddr=$(get_lrf $1 2 $2)
        tmpaddr=0f

	i2cdetect -y -r $i2cnum 0x$tmpaddr 0x$i2caddr > $detfile
	sed -i '1d' $detfile
	sed -i 's/[^ ]*//' $detfile
	grep -q $i2caddr $detfile
	if [ $? -eq 0 ]; then
	        return 0
	else
		grep -q UU $detfile
		if [ $? -eq 0 ]; then
			return 0
		else
			return 1
		fi
	fi
}

function clean_up() {
# delect temp file
	rm -f /run/factory/det-i2c
}

checknum=$(wc -l < $checklist)

while [ $checknum -gt 0 ]
do
	chipname=$(get_lrf $checknum 3 $checklist)
	check_i2c_addr $checknum $checklist
	if [ $? -eq 0 ]; then
		echo "PASS: chip <$chipname> addr <$i2caddr> detected!"
	else
		echo "FAIL: chip <$chipname> addr <$i2caddr> can't detected!"
	fi
	checknum=$(($checknum-1))
done

clean_up

