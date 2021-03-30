echo "This will damage speaker, please garantee speaker is not connected!"
echo "Press ANY key to continue or CTRL+C to abort!"
read -t 3 -n 1
adk-message-send 'system_mode_management {name:"audio_Streaming"}'
hal_play_test -f $1 -t 1 -d 2 -v 1 -r 1920000 -c
adk-message-send 'system_mode_management {name:"audio_Stoppped"}'
