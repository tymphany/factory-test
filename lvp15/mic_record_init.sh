#!/bin/sh
# init record
# mic record setting

tinymix set "MultiMedia1 Mixer VA_CDC_DMA_TX_0" "1" 
tinymix set "VA_CDC_DMA_TX_0 Channels" "Three"
tinymix set "VA_AIF1_CAP Mixer DEC0" "1"
tinymix set "VA_AIF1_CAP Mixer DEC1" "1"
tinymix set "VA_AIF1_CAP Mixer DEC2" "1"
tinymix set "VA DMIC MUX0" "DMIC0"
tinymix set "VA DMIC MUX1" "DMIC1"
tinymix set "VA DMIC MUX2" "DMIC2"

echo "OK"

