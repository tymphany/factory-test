#!/bin/sh
# only using soc board, disabled using mclock. 
# run this script when adb service ok

rmmod /usr/lib/modules/4.14.117/extra/adsp_loader_dlkm.ko

echo "ok"