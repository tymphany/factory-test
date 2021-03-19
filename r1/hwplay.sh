tinymix set "PRIM_MI2S_RX Format" "S24_LE"
tinymix set "PRI_MI2S_RX Audio Mixer MultiMedia1" "1"
tinymix set "PRIM_MI2S_RX Channels" Four
systemctl stop btapp
systemctl stop pulseaudio
tinyplay $1
systemctl start pulseaudio
systemctl start btapp
