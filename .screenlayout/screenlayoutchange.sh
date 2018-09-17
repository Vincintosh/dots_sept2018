#!/bin/sh

# screenlayoutchange.sh

if xrandr | grep 'HDMI-1' | grep ' connected' &>/dev/null; then
  if xrandr --listactivemonitors | grep -q 'eDP-1'; then
    xrandr --output DP-1 --off --output HDMI-1 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output eDP-1 --off --output HDMI-2 --off
    notify-send " xrandr" "Screen layout changed: HDMI-1"
  else
    xrandr --output DP-1 --off --output HDMI-1 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output eDP-1 --mode 1920x1080 --pos 2560x0 --rotate normal --output HDMI-2 --off
    notify-send " xrandr" "Screen layout changed: HDMI-1 + eDP-1"
  fi
else
  notify-send " xrandr" "No external displays connected"
fi
