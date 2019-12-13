#!/bin/sh
# for I2C inventory check
# input check list formal as:
#   <Bus Number>   <Address>  <Component Name>
# exp:
#I2C-2 20 AMP-MA12070-1      
#
checklist=$1
buslist=/data/i2c-buslist

if [ -z "$1" ]; then
	echo "FAIL: No Checklist input!"
elif [ ! -f $1 ]; then 
	echo "FAIL: Input file don't exit!"
fi

i2cdetect -l > $buslist

busnum=$(wc -l < $buslist)

echo "busnum : $busnum"

while [ $busnum -gt 0 ]
do
	case $busnum in
	    1) i2cnum=$(awk 'NR==1 {print $1}' $buslist | cut -c 5 );;
	    2) i2cnum=$(awk 'NR==2 {print $1}' $buslist | cut -c 5 );;
	    3) i2cnum=$(awk 'NR==3 {print $1}' $buslist | cut -c 5 );;
	    4) i2cnum=$(awk 'NR==4 {print $1}' $buslist | cut -c 5 );;
	    5) i2cnum=$(awk 'NR==5 {print $1}' $buslist | cut -c 5);;
	    *) echo "FAIL: Out of range" break;;
	esac
	echo "i2cnum= $i2cnum"
	detfile=/data/det-i2c-$i2cnum
	i2cdetect -y -r $i2cnum > $detfile

	echo "$i2cnum"
	echo "$detfile"

	busnum=$(($busnum-1))
	echo "busnum: $busnum"
done
