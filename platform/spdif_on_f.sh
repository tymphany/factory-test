#!/bin/sh
# spdif on

adk-message-send 'audio_volume_set {value : 1}'
tinymix set "PRI SPDIF TX Source" "Coaxial"
pactl set-source-port 0 spdif-in
pactl set-default-source 0
gst-launch-1.0 pulsesrc ! 'audio/x-raw, rate=(int)48000, channels=(int)2'! pulsesink
