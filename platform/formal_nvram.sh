#!/bin/sh
# for formal NVRAM

dd if=/dev/zero of=/data/nvram_ro bs=1K count=512
mkfs.nvram /data/nvram_ro rw
dd if=/data/nvram_ro of=/dev/disk/by-partlabel/syscfg bs=1K count=512
