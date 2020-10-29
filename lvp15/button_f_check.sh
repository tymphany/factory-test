#!/bin/sh
# button test
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
keylist=$SHELL_FOLD/conf/key_list.conf
echo "formation button test"

if [ -z "$1" ]; then
        echo "FAIL: Please input source! examle: button_f_check.sh cypress/power/encoder"
        exit 0
fi

if [ $1 == "cypress" ]
then
   source_test="event1"
elif [ $1 == "power" ]
then
   source_test="event3"
elif [ $1 == "encoder" ]
then
   source_test="event2"
else
   echo "FAIL: not this source, support cypress, power, encoder"
   exit 0
fi

$BASE_FOLD/platform/button_f.sh $keylist $source_test
exit $?
