#!/bin/sh

version_h=$((`i2cget -f -y 2 0x08 0x12`))
version_l=$((`i2cget -f -y 2 0x08 0x13`))
echo $version_h"."$version_l
