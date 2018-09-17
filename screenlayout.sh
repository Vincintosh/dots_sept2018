#!/bin/sh
#xrandr --output DP-1 --off --output HDMI-1 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output eDP-1 --off --output HDMI-2 --off

sleep .1
if xrandr | grep 'HDMI-1' | grep ' connected' &>/dev/null; then
  echo 'HDMI-1 connected, restoring layout'
  xrandr --output DP-1 --off --output HDMI-1 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output eDP-1 --off --output HDMI-2 --off
  echo 'Calling feh for desktop wallpaper'
  feh --randomize --bg-fill ~/Immagini/walls
  echo 'Running polybar'
  polybar top &
  echo 'Done'
else
  echo 'No HDMI-1 detected, reverting to laptop display'
  xrandr --output DP-1 --off --output HDMI-1 --off --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --off
  echo 'Calling feh for desktop wallpaper'
  feh --randomize --bg-fill ~/Immagini/walls
  echo 'Running polybar'
  polybar top &
  echo 'Done'
fi

# Welcome back notification/startup sound
echo 'Sending notification'
notify-send "Bentornato $(whoami)"
