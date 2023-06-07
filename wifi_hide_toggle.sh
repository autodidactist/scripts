#!/bin/bash

SWITCH=$(wifi | grep -oE '\b\w{2,3}\b')

if [[ $SWITCH == "on" ]]; then
   	cp /home/shahid/Trash/sb-internet\
       /home/shahid/dotfiles/.local/bin/statusbar/sb-internet
else
   if [[ -e "/home/shahid/dotfiles/.local/bin/statusbar/sb-internet" ]]; then
       mv /home/shahid/dotfiles/.local/bin/statusbar/sb-internet\
          /home/shahid/dotfiles/.local/bin/statusbar/sb-internet.bak
   fi
fi
