#!/bin/bash

# Check if external monitor is connected
if xrandr | grep -q "HDMI-A-0 connected"; then
  # Work setup - use the dedicated work-setup.sh script
  ~/dotfiles/scripts/work-setup.sh
else
  # Only laptop monitor is available
  ~/dotfiles/scripts/laptop-only-setup.sh
fi
