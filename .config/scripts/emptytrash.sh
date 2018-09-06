#!/bin/sh

#emtytrash.sh

rm -Rf /home/vincintosh/.local/share/Trash/files/* || notify-send 'Errore nello svuotamento del cestino'
aplay /home/vincintosh/.config/trash.wav
exit 0
