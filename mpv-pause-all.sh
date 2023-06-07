#!/bin/sh

# PID
list=$(xdotool search --class mpv)

# Action
for i in $list; do 
   xdotool key --window "$i" p
done



