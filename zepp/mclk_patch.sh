#!/bin/sh

# When test RF,test station only has mainboard, then som can't 
# recive mclk, programe will auto-reboot, so we need to rm adsp_loader_dlkm.ko
rmmod /usr/lib/modules/4.14.117/extra/adsp_loader_dlkm.ko
