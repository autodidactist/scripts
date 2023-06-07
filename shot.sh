#!/bin/sh

DIR="$HOME/Pictures"
DIRF="$HOME/Pictures/Focused"
FOCUS="scrot -u -b"
FULL="scrot"

case "$1" in
	--full|-f|$NULL)
		cd $DIR
		exec $FULL && notify-send "Screenshot saved in $DIR"
		;;
	--active|-a)
		cd $DIRF
		exec $FOCUS && notify-send "Screenshot saved in $DIRF"
		;;
	--help|-h)

echo "Screenshot taking tool"
echo "available options:
	-f | --full    full screen
	-a | --active  active window
	-h | --help    display this information"
esac
