#!/bin/bash

# Check if external monitor is connected
if ! xrandr | grep -q "HDMI-A-0 connected"; then
  # External monitor is not connected
  notify-send "Monitor Error" "External monitor is not connected. Cannot apply work setup."
  exit 1
fi

# Set up the external monitor as primary, positioned to the left of laptop
xrandr --output HDMI-A-0 --primary --mode 1920x1080 --rate 60.00 --output eDP --mode 1920x1080 --rate 60.02 --right-of HDMI-A-0

# Wait for X to apply changes
sleep 1

# Set workspace assignments for dual monitor setup
for i in {1..5}; do
  i3-msg "workspace $i output HDMI-A-0"
done

for i in {6..10}; do
  i3-msg "workspace $i output eDP"
done

# Force reload i3 config to apply new workspace assignments
i3-msg reload
sleep 0.5

# Show default workspaces on each monitor
i3-msg "workspace 1"  # Go to workspace 1 on external monitor
sleep 0.5
i3-msg "workspace 9"  # Go to workspace 9 on laptop monitor

# Notify user
notify-send "Work Setup Applied" "Workspaces configured for work setup with external monitor on the left"
