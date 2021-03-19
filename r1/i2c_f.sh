#!/bin/sh
# for I2C inventory check
# input check list formal as:
#   <Bus Number>   <Address>  <Component Name>
# exp:
#i2c-2 20 AMP-MA12070-1
#
#NOTICE: I2C address using 7bit more and number as hex form !!!
checklist=$1
mkdir -p /run/factory

if [ -z "$1" ]; then
	echo "FAIL: No Checklist input!"
elif [ ! -f $1 ]; then 
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

	i2cdetect -y -r $i2cnum 0x$i2caddr 0x$i2caddr > $detfile
	sed -i '1d' $detfile
	sed -i 's/[^ ]*//' $detfile
	grep -q $i2caddr $detfile
	if [ $? -eq 0 ]; then
	        return 0
	else
		grep -q UU $detfile
		if [ $? -eq 0 ]; then
			i2cget -y -f $i2cnum 0x$i2caddr 0x00 > /dev/null 2>&1
			if [ $? -eq 0 ]; then
			        return 0
			else
				return 1
			fi
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

echo "checknum : $checknum"
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

