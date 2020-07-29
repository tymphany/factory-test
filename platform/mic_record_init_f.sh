#/bin/sh
# Mic record setting

tinymix set "MultiMedia1 Mixer VA_CDC_DMA_TX_0" "1" 
tinymix set "VA_CDC_DMA_TX_0 Channels" "Four"
tinymix set "VA_AIF1_CAP Mixer DEC0" "1"
tinymix set "VA_AIF1_CAP Mixer DEC1" "1"
tinymix set "VA_AIF1_CAP Mixer DEC2" "1"
tinymix set "VA_AIF1_CAP Mixer DEC3" "1"
tinymix set "VA DMIC MUX0" "DMIC0"
tinymix set "VA DMIC MUX1" "DMIC1"
tinymix set "VA DMIC MUX2" "DMIC2"
tinymix set "VA DMIC MUX3" "DMIC3"

echo "OK"
