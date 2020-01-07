#!/bin/sh
# for i2c inventory check
# mkdir -p /data/factory
# checklist=/data/factory/i2cchecklist
# echo -e $(cat << EOF 
# i2c-2 20 PA1-MA12070 \n
# i2c-2 21 PA2-MA12070 \n
# i2c-2 22 PA3-MA12070 \n
# i2c-3 c8 VLED-IS31FL3196A \n
# i2c-3 ce KB-LED-IS31FL3196A 
# EOF
# ) > $checklist
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
checklist=$SHELL_FOLD/conf/inventory.conf
$BASE_FOLD/platform/i2c_f.sh $checklist
