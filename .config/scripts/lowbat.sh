#!/bin/sh

# lowbat.sh


acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
	read -r status capacity
	
	if [ "$status" = Discharging -a "$capacity" -lt 6 ]; then
		logger "Critical battery threshold: hibernation signal sent"
		sudo -u vincintosh DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "Livello batteria critico" "Il sistema sta per essere ibernato!"	
		sleep 5
		systemctl hibernate || ( sudo -u vincintosh DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus twmnc --sc /home/vincintosh/.config/sil.wav -t  "Ibernazione non correttamente configurata" -c "Il sistema verrà sospeso fra 90 secondi: salvare il lavoro!" && sleep 90 && systemctl suspend )
	fi
}
