#!/bin/sh
# Change bt name
# input formal:
# ./change_bt_name.sh name
# $s1 : bt name

if [ -z "$1" ]; then
        echo "FAIL: Please input BT name! Command Example: ./change_bt_name.sh name"
        exit 0
fi

adk-message-send 'connectivity_bt_setname {name: "'$1'"}'

echo "ok"


