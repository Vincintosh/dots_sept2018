#!/bin/sh

DIALOG=$(echo -e 'spegnimento\nsospensione\nriavvio\nblocco schermo\nlogout\n[ibernazione]' | rofi -dmenu -i -p "[Chiusura Sessione]" -hide-scrollbar -tokenize -lines 4 -eh 2 -width 40 -location 8 -xoffset 150 -yoffset 70 -padding 50 -font "inconsolata 16")

echo "Scelta: $DIALOG"
sleep .1;

if [ "$DIALOG" = "spegnimento" ]; then
	exec systemctl poweroff
elif [ "$DIALOG" = "sospensione" ]; then
	 twmnc --sc /home/vincintosh/.config/sil.wav -c "Sospensione in corso..." && systemctl suspend
elif [ "$DIALOG" = "riavvio" ]; then
	exec systemctl reboot
elif [ "$DIALOG" = "blocco schermo" ]; then
	exec i3lock-fancy
elif [ "$DIALOG" = "logout" ]; then
	exec i3-msg 'exit'
elif [ "$DIALOG" = "[ibernazione]" ]; then
	notify-send "Ibernazione" "Avvio procedura di ibernazione..." && systemctl hibernate
else
	echo "Nessuna selezione"
fi
