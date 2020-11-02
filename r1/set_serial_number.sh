#!/bin/sh

INFO_PATH=/persist/factory/product-message

sed -i "4c MODUL_SN $1" $INFO_PATH/r1.txt

echo OK

