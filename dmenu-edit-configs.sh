#!/bin/bash

set -xe

declare options=("alacritty
bash
broot
bspwm
transmission
doom.d/config.el
doom.d/init.el
doom.d/bindings.el
doom.d/packages.el
dmenu
dunst
dwm
mpv-input
dwmblocks
statusbar
emacs.d/init.el
snippets
kitty
fonts
herbstluftwm
goneovim
i3
install.sh
neovim
newsboat
mpv
xinitrc
polybar
picom
qtile
st
stumpwm
surf
xprofile
sxhkd
tabbed
termite
vifm
starship
vim
vimb
xmobar
xmonad
xresources
url
zsh
quit
ranger
qutebrowser
zathura
Tmux
spectrwm
mpd
ncmpcpp
blocks
lf
zprofile")

FILE=$(echo -e "${options[@]}" | dmenu -i  -fn 'mono-15' -p 'Edit config : ')

case "$FILE" in
	quit)
		echo "Program terminated." && exit 1
	;;
	alacritty)
		FILE_PATH="$HOME/.config/alacritty/alacritty.yml"
	;;
	awesome)
		FILE_PATH="$HOME/.config/awesome/rc.lua"
	;;
	bash)
		FILE_PATH="$HOME/.bashrc"
	;;
	broot)
		FILE_PATH="$HOME/.config/broot/conf.toml"
	;;
	bspwm)
		FILE_PATH="$HOME/.config/bspwm/bspwmrc"
	;;
	compton)
		FILE_PATH="$HOME/.config/compton/compton.conf"
	;;
	doom.d/bindings.el)
		FILE_PATH="$HOME/.doom.d/bindings.el"
	;;
	doom.d/config.el)
		FILE_PATH="$HOME/.doom.d/config.el"
	;;
doom.d/packages.el)
		FILE_PATH="$HOME/.doom.d/packages.el"
	;;
	doom.d/init.el)
		FILE_PATH="$HOME/.doom.d/init.el"
	;;
	dunst)
		FILE_PATH="$HOME/.config/dunst/dunstrc"
	;;
	dwm)
		FILE_PATH="$HOME/dotfiles/dwm/config.h"
	;;
	dwmblocks)

		FILE_PATH="$HOME/dotfiles/dwmblocks/config.h"
	;;

	emacs.d/init.el)
		FILE_PATH="$HOME/.emacs.d/init.el"
	;;
	herbstluftwm)
		FILE_PATH="$HOME/.config/herbstluftwm/autostart"
	;;
	i3)
		FILE_PATH="$HOME/.i3/config"
	;;
	neovim)
		FILE_PATH="$HOME/.config/nvim/init.vim"
	;;
	polybar)
		FILE_PATH="$HOME/.config/polybar/config.ini"
	;;
	qtile)
		FILE_PATH="$HOME/.config/qtile/config.py"
	;;
	st)
		FILE_PATH="$HOME/.config/st/config.h"
	;;
	stumpwm)
		FILE_PATH="$HOME/.config/stumpwm/config"
	;;
	surf)
		FILE_PATH="$HOME/.config/surf/config.h"
	;;
	sxhkd)
		FILE_PATH="$HOME/.config/sxhkd/sxhkdrc"
	;;
	tabbed)
		FILE_PATH="$HOME/tabbed-distrotube/config.h"
	;;
	termite)
		FILE_PATH="$HOME/.config/termite/config"
	;;
	vifm)
		FILE_PATH="$HOME/.config/vifm/vifmrc"
	;;
	vim)
		FILE_PATH="$HOME/.vimrc"
	;;
	vimb)
		FILE_PATH="$HOME/.config/vimb/config"
	;;
	xmobar)
		FILE_PATH="$HOME/.config/xmobar/xmobarrc2"
	;;
	xmonad)
		FILE_PATH="$HOME/.xmonad/xmonad.hs"
	;;
	xresources)
		FILE_PATH="$HOME/.config/X11/xresources"
	;;
	zsh)
		FILE_PATH="$HOME/.config/zsh/.zshrc"
	;;
	ranger)
		FILE_PATH="$HOME/.config/ranger/rc.conf"
	;;
	qutebrowser)
		FILE_PATH="$HOME/.config/qutebrowser/config.py"
	;;
	zathura)
		FILE_PATH="$HOME/.config/zathura/zathurarc"
	;;
	spectrwm)
		FILE_PATH="$HOME/config/.spectrwm.conf"
	;;
	lf)
		FILE_PATH="$HOME/.config/lf/lfrc"
		;;
	mpd)
		FILE_PATH="$HOME/.config/mpd/mpd.conf"
		;;
	ncmpcpp)
		FILE_PATH="$HOME/.config/ncmpcpp/config"
		;;
	dmenu)
		FILE_PATH="$HOME/.config/dmenu/config.h"
		;;
	newsboat)
		FILE_PATH="$HOME/.config/newsboat/config"
		;;
	url)
		FILE_PATH="$HOME/.config/newsboat/urls"
		;;

	fonts)
		FILE_PATH="$HOME/.config/fontconfig/fonts.conf"
		;;
	mpv)
		FILE_PATH="$HOME/.config/mpv/mpv.conf"

		;;

	mpv-input)
		FILE_PATH="$HOME/.config/mpv/input.conf"
		;;

	transmission)
		FILE_PATH="$HOME/.config/transmission-remote-cli/settings.cfg"

		;;
	picom)
		FILE_PATH="$HOME/.config/picom.conf"
		;;
	Tmux)
		FILE_PATH="$HOME/.config/tmux/tmux.conf"
		;;
	snippets)
		FILE_PATH="$HOME/.config/nvim/my_snippets.vim"
		;;
	starship)
		FILE_PATH="$HOME/.config/starship.toml"
		;;
		xinitrc)
			FILE_PATH="$HOME/.config/X11/xinitrc"
			;;
		xprofile)
			FILE_PATH="$HOME/.config/X11/xprofile"
			;;
		goneovim)
			FILE_PATH="$HOME/.goneovim/setting.toml"
			;;
		kitty)
			FILE_PATH="$HOME/.config/kitty/kitty.conf"
			;;
	 install.sh)
			FILE_PATH="$HOME/install.sh"
			;;
   zprofile)
		FILE_PATH="$HOME/.config/zsh/.zprofile"
    ;;
   statusbar)
		FILE_PATH="$HOME/.local/bin/statusbar"
    ;;


	*)
		exit 1
	;;
esac

   fullPath=$(readlink -f "$FILE_PATH")
   dir=$(dirname $fullPath)
   cd $dir;

   if [[ $FILE == "statusbar" ]] ; then
      cd $fullPath
      alacritty -e nvim  -c "NvimTreeToggle" 
   else
      alacritty -e nvim "$FILE_PATH"
   fi


