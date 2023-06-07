#!/bin/sh
# set -xe
cd $HOME/wiki;
FILE=$(ls *.zim | dmenu -l 15 -fn "mono-14") 
[  $FILE = "" ] &&  exit

PATH="$(readlink -f $FILE)"
PORT="$(echo "" | /bin/dmenu  -p "PORT: " -fn "mono-14")"
echo localhost:$PORT | /home/shahid/dotfiles/.local/bin/scripts/copy   && echo "localhost:$PORT -> $FILE"
/home/shahid/dotfiles/.local/bin/scripts/killport "$PORT" && /bin/kiwix-serve -p "$PORT" "$PATH"

