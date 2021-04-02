#!/bin/sh
# Shutdown devices

/etc/exitscripts/board-script/shutdown.sh
if [ $? -eq 0 ]; then
        echo "OK"
fi
