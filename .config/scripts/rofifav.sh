#!/bin/sh

DIALOG=$(echo -e 'terminal\nfirefox\ngedit\nnautilus\npavucontrol' | rofi -dmenu -i -p "[Preferiti]" -hide-scrollbar -tokenize -lines 5 -eh 2 -width 40 -location 8 -xoffset 150 -yoffset 70 -padding 50 -font "RobotoMono Nerd Font 14")

echo "Scelta: $DIALOG"
sleep .1;

if [ "$DIALOG" = "terminal" ]; then
	exec urxvt
elif [ "$DIALOG" = "firefox" ]; then
	exec firefox
elif [ "$DIALOG" = "gedit" ]; then
	exec gedit
elif [ "$DIALOG" = "nautilus" ]; then
	exec nautilus
elif [ "$DIALOG" = "pavucontrol" ]; then
	exec pavucontrol
fi
