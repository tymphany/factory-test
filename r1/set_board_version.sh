#!/bin/sh

INFO_PATH=/persist/factory/product-message

sed -i "2c BOARD_VERSION $1" $INFO_PATH/r1.txt

echo OK

