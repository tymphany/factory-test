#!/bin/sh

INFO_PATH=/persist/factory/product-message

#judge if $1 is not empty 
if [ ! -n "$1" ]
then
	echo FAIL
else
	sed -i "5c PRODUCT_SN $1" $INFO_PATH/r1.txt
	echo OK	
fi

