#!/bin/sh

# restore.sh

# Restores laptop display if it was disabled when an external one was connected.
# Run this with a key combination in your WM instead of tinkering with udev rules.

xrandr --output DP-1 --off --output HDMI-1 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --off

# Restarting polybar
killall polybar
polybar top &

# Sending notification
notify-send " xrandr" "Layout restored: eDP-1"
