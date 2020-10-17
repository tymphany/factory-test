#!/bin/sh
# battery temp & voltage & capacity

run_result=`/usr/bin/bq40z50`
#temp=`echo $run_result | cut -d ' ' -f 54`
#vol=`echo $run_result | cut -d ' ' -f 55`
temp_vol=$(echo $run_result | awk -F " " '{print $(NF-1)"C "$NF"mv"}')
capacity=`i2ctransfer -y -f 3 w1@0x0b 0x0d r1`
echo $temp_vol" cap="$(($capacity))"%"

