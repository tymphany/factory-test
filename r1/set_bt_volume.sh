#!/bin/sh
# set volume range -120 - 0
if [ $1 -gt 0 ] || [ $1 -lt -120 ]
then
	echo "volume range -120 to 0"
else
	echo $1 > /data/volume_db
	echo "OK"
fi
