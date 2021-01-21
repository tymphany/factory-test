AMPInitStatus="Off"
while [ ! -f /dev/shm/AMPInitStatus ];
do
sleep 0.5
done

while [ $AMPInitStatus != "Powered" ];
do
    read AMPInitStatus < /dev/shm/AMPInitStatus
    sleep 0.5
done