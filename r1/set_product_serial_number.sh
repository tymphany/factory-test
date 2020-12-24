#!/bin/sh

INFO_PATH=/persist/factory/product-message

sed -i "5c PRODUCT_SN $1" $INFO_PATH/r1.txt

echo OK

