#!/bin/bash

# echo "aki1012" | sudo -S killall pipewire 
# echo "aki1012" | sudo -S killall pipewire-pulse 
# echo "aki1012" | sudo -S killall pipewire-media-session 

# killall pipewire &
# pipewire-pulse &
# pipewire-media-session &

# PID=$(pidof pipewire pipewire-media-session pipewire-pulse\
#     | tr " " "," | sed -e 's/^/\[/' | sed -e 's/$/\]/')

PID=$(pidof pipewire pipewire-media-session pipewire-pulse)

for i in ${PID[@]}; do
   echo "aki1012" | sudo -S  kill $i
done

# echo "aki1012"  | sudo -S kill $PID
