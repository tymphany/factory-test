#!/bin/sh
# play audio file

if [ !-e $1 ]; then
	echo "FAIL: Please input audio file path"
fi

paplay $1

