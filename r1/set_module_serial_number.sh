#!/bin/sh

INFO_PATH=/persist/factory/product-message

#judge whether $1 is empty or not
if [ ! -n "$1" ]
then
	#$1 is empty
	echo FAIL
else
	sed -i "4c MODUL_SN $1" $INFO_PATH/r1.txt
	echo OK	
fi

