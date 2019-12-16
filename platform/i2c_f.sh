#!/bin/sh
# for I2C inventory check
# input check list formal as:
#   <Bus Number>   <Address>  <Component Name>
# exp:
#i2c-2 20 AMP-MA12070-1
#
checklist=$1
mkdir -p /data/factory
buslist=/data/factory/i2c-buslist

if [ -z "$1" ]; then
	echo "FAIL: No Checklist input!"
elif [ ! -f $1 ]; then 
	echo "FAIL: Input file don't exit!"
fi

i2cdetect -l > $buslist

busnum=$(wc -l < $buslist)

# get line row context from file
# get_lrf <line> <row> <file path>
function get_lrf() {
	awk -v line=$1 -v row=$2 'line==NR { print $row}' $3
}
echo "busnum : $busnum"

while [ $busnum -gt 0 ]
do
	if [ $busnum -le 5 ]; then
		i2cnum=$(get_lrf $busnum 1 $buslist | cut -c 5 )
	else
		 echo "FAIL: i2c bus number out of range"
	fi

	detfile=/data/factory/det-i2c-$i2cnum
	i2cdetect -y -r $i2cnum > $detfile

	sed -i '1d' $detfile
	sed -i 's/[^ ]*//' $detfile
	busnum=$(($busnum-1))
done

function clean_up() {
# delect temp file
	rm -f /data/factory/det-i2c-*
	rm -f $buslist

}

checknum=$(wc -l < $checklist)

echo "checknum : $checknum"
while [ $checknum -gt 0 ]
do
	detfile=/data/factory/det-$(get_lrf $checknum 1 $checklist)
	i2caddr=$(get_lrf $checknum 2 $checklist)
	chipname=$(get_lrf $checknum 3 $checklist)

	grep -q "$i2caddr" $detfile
	if [ $? -eq 0 ]; then
		echo "PASS: chip <$chipname> addr <$i2caddr> detected!"
	else
		echo "FAIL: chip <$chipname> addr <$i2caddr> can't detected!"
	fi
	checknum=$(($checknum-1))
done
