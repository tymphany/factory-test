#!/bin/sh
# close mic loopback

pkill -f "loopback"

if [ $? -eq 0 ]; then 
	echo "OK"
fi
