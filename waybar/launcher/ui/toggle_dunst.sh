#!/bin/bash

# toggle_dunst.sh
# Script to toggle dunst (Do Not Disturb notification)

# Check if dunst is running
if dunstctl is-paused = false; then
  notify-send "Notifications" "Do Not Disturb: ON"
  sleep 2
else
  notify-send "Notifications" "Do Not Disturb: OFF"
fi

dunstctl set-paused toggle
