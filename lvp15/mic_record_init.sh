#!/bin/sh
# init record
# mic record setting

tinymix set "MultiMedia1 Mixer VA_CDC_DMA_TX_0" "1" 
tinymix set "VA_CDC_DMA_TX_0 Channels" "Three"
tinymix set "VA_AIF1_CAP Mixer DEC0" "1"
tinymix set "VA_AIF1_CAP Mixer DEC2" "1"
tinymix set "VA_AIF1_CAP Mixer DEC4" "1"
tinymix set "VA DMIC MUX0" "DMIC0"
tinymix set "VA DMIC MUX2" "DMIC2"
tinymix set "VA DMIC MUX4" "DMIC4"

echo "OK"

