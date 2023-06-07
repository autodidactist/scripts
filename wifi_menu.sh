#!/bin/sh

ANS="$(printf "ON\nOFF" | dmenu -i -fn "mono-14" -p "$1"  -p "Wifi:" )"

case $ANS in
	"ON"|$NULL)
	sudo	 wifi on  && wifi_hide_toggle.sh
		;;
	"OFF")
	 sudo  wifi off && wifi_hide_toggle.sh
		;;
esac
