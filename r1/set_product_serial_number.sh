#!/bin/sh

INFO_PATH=/persist/factory/product-message

#judge whether $1 is empty or not 
if [ ! -n "$1" ]
then
	#$1 is empty
	echo FAIL
else
	sed -i "5c PRODUCT_SN $1" $INFO_PATH/r1.txt
	echo $1 > /etc/adb_devid
	echo OK	
fi

