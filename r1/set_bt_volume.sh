#!/bin/sh
# set volume range 0 - 1.0
if [ $1 -ge 0 ]
then
	echo "volume range -120 to 0"
else
	echo $1 > /data/volume_db
	echo "OK"
fi
