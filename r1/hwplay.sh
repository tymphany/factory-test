echo "This will damage speaker, please garantee speaker is not connected!"
echo "Press ANY key to continue or CTRL+C to abort!"
read -t 3 -n 1
adk-message-send 'system_mode_management {name:"audio_Streaming"}'
tinymix set "PRIM_MI2S_RX Format" "S24_LE"
tinymix set "PRI_MI2S_RX Audio Mixer MultiMedia1" "1"
tinymix set "PRIM_MI2S_RX Channels" Four
systemctl stop btapp
systemctl stop pulseaudio
tinyplay $1
systemctl start pulseaudio
systemctl start btapp
adk-message-send 'system_mode_management {name:"audio_Stoppped"}'
