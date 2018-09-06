#!/bin/sh

# bat.sh

BATTIME="$(acpi | awk '{print $3}')"
BATTIMEC="$(acpi | awk '{print $5}')"

if [ $BATTIME = "Discharging," ]; then
	notify-send "Alimentazione" "Autonomia stimata $BATTIMEC"
else
	notify-send "Alimentazione" "Cavo di alimentazione connesso"

fi
echo $BATTIMEC
