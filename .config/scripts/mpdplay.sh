#!/bin/sh

# mpdplay.sh

# If mpd is not running start it
if ! pgrep -x "mpd" > /dev/null
then
	mpd
	notify-send "MPD started"
fi

# Then toggle play/pause
mpc toggle
