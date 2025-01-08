#!/bin/bash

# Path to your Polybar config file
CONFIG="/home/marcel/dotfiles/polybar/.config/polybar/config.ini"

# Launch Polybar on each connected monitor
if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload --config="$CONFIG" toph &
  done
else
  polybar --reload --config="$CONFIG" toph &
fi
