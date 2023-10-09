#!/bin/bash

# toggle_dunst.sh
# Script to toggle dunst (Do Not Disturb notification)

# Check if dunst is running
if pgrep -x "dunst" > /dev/null; then
  # If running, kill it and notify the user
  notify-send "Notifications" "Do Not Disturb: ON"
  sleep 2
  killall dunst
else
  # If not running, start it and notify the user
  dunst &
  notify-send "Notifications" "Do Not Disturb: OFF"
fi
