#!/bin/bash

# Laptop-only setup - Set laptop as primary display and disable HDMI
xrandr --output eDP --auto --primary
xrandr --output HDMI-A-0 --off

# Ensure all workspace assignments point to the laptop
for i in {1..10}; do
  i3-msg "workspace $i output eDP"
done

# Force reload i3 config to apply new workspace assignments
i3-msg reload
sleep 0.5

# Move each workspace to the laptop screen
for i in {1..10}; do
  # Go to workspace and move it to laptop
  i3-msg "move workspace to output eDP"
done

# Always go to workspace 1
i3-msg "workspace 1"
