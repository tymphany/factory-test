#!/bin/sh

if [ -z "$1" ]; then
        echo "FAIL: Please input music file! "
        exit 0
fi

if [ -z "$2" ]; then
        echo "FAIL: Please input volume gain! "
        exit 0
fi

gst-launch_64-1.0 filesrc location= $1 ! wavparse ignore-length=1 ! audioconvert ! flowdspgst name=flowdsp msg=set/GAIN_ST_2009796420080/gain/$2 ! pulsesink
