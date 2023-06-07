#!/bin/bash

Numpy="$HOME/opt/Dox/numpy"
Hoogle="$HOME/opt/Dox/hoogle"
Pandas="$HOME/opt/Dox/pandas"
Python="$HOME/opt/Dox/python"
Scipy="$HOME/opt/Dox/scipy"
Torch="$HOME/opt/Dox/torch"
Vision="$HOME/opt/Dox/vision"
Ocaml="$HOME/opt/Dox/ocaml"
Go="$HOME/opt/Dox/Go/Contents/Resources/Documents/"
Matplotlib="$HOME/opt/Dox/Matplotlib/Contents/Resources/Documents/"
# Rust="$HOME/opt/Dox/Rust/Contents/Resources/Documents/"
D="$HOME/opt/Dox/D/d/"
wiki="$HOME/wiki/"

declare options=("Mousewheel
Day-Mode
Dlang
Numpy
Firefox-Private
Youtube-Block
Haskell
Chat CCP
Hoogle
Hide_Wifi
Youtube-Upload-Allow
Pandas
Python
Scipy
Torch
Redshift
Go
Rust
Time_and_Date_Fix
Matplotlib
Redshift-Kill
Vision
Mousewheel
Ocaml
Scrot
Setbg
Kill_Emacs
Wikipedia-zim
Wikipedia
Wikibooks
MDN-Docs
Blur
Powertop
Pulseaudio_restart
")

FILE=$(echo -e "${options[@]}" | dmenu -i -fn "mono-15" -p "$1" -nb  "#1d1100"  -sb "#6fa695" -sf "#010101" -nf gray  -p 'Run Scripts:')

case "$FILE" in

Mousewheel)
	 exec mouse_wheel.sh
		;;
Python)
	 cd $Python; serve 8080
	 ;;
Hoogle)
	 cd $Hoogle; serve 8081
	 ;;
Haskell)
	 cd $Hoogle; serve 8081
	 ;;
Numpy)
	 cd $Numpy; serve 8082
	 ;;
Pandas)
	 cd $Pandas; serve 8083
	 ;;
Scipy)
	 cd $Scipy; serve 8084
	 ;;
Torch)
	 cd $Torch; serve 8085
	 ;;
Vision)
	 cd $Vision; serve 8086
	 ;;
Ocaml)
	 cd $Ocaml; serve 8087
	 ;;
Go)
	 cd $Go; serve 8088
	 ;;
Rust)
	 rustup doc
	 ;;
Matplotlib)
	 cd $Matplotlib; serve 8090
	 ;;
Dlang)
	 cd $D; serve 8091
	 ;;
Redshift)
	 exec redshift -l 12.9716:77.5946;
	 ;;
Redshift-Kill)
	 pidof redshift | xargs kill
	 ;;
Day-Mode)
	 exec redshift -l 42.9716:17.5946;
	 ;;
Wikipedia)
	 cd $wiki && serve  9999 wikipedia_en_all_maxi_2021-12.zim
	 ;;
 "Chat CCP")
	 chromium --incognito "https://chatbot.theb.ai/"
	 ;;
Wikipedia-zim)
	 killport 8888; cd $wiki && python serve.py & notify-send "Wikipedia -> localhost:8888" ; echo "localhost:8888" | copy ;
	 ;;
Wikibooks)
	 cd $wiki && serve 7777 wikibooks_en_all_maxi_2021-03.zim
	 ;;
MDN-Docs)
	 cd $wiki && serve 5000  developer.mozilla.org_en_all_2022-03.zim
	 ;;
Setbg)
	 exec setbg
	 ;;
Kill_Emacs)
	 exec pidof emacs | cut  -f 1 -d " " | xargs kill
	 ;;
Scrot)
	 cd "$HOME/Pictures" &&	scrot -s
	 ;;
Powertop)
	 sudo powertop --auto-tune
	 ;;
 Blur)
	 picom --experimental-backends --backend glx --vsync  --blur-method dual_kawase --blur-strength 8 -b &
	 ;;
 Pulseaudio_restart)
	exec pulseaudio_restart.sh
	;;
# Youtube-Upload-Allow)
# 	echo "aki1012" | sudo -S cp /etc/hosts /etc/hosts.bak
# 	echo "aki1012" | sudo -S cp /etc/hosts.yt /etc/hosts
# 	;;
Youtube-Block)
	echo "aki1012" | sudo -S cp /etc/hosts.bak /etc/hosts
	echo "aki1012" | sudo -S sv restart wpa_supplicant
	;;
Firefox-Private)
	firefox --private-window
	;;
Time_and_Date_Fix)
	sudo  ntpdate -u in.pool.ntp.org  &
	;;
Hide_Wifi)
	mv /home/shahid/dotfiles/.local/bin/statusbar/sb-internet /home/shahid/dotfiles/.local/bin/statusbar/sb-internet.bak
*)
	 exit 1
	 ;;
esac
# alacritty -e nvim "$FILE"
