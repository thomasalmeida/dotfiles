#!/bin/bash

# toggle_dunst.sh
# Script to toggle dunst (Do Not Disturb notification)

# Check if dunst is running
case $(dunstctl is-paused) in
    true)
      dunstctl history-clear
      dunstctl close-all

      dunstctl set-paused toggle
      notify-send "Do Not Disturb" "Notifications ON"
      ;;
    false)
      notify-send "Do Not Disturb" "Notifications OFF"
      sleep 1
      dunstctl set-paused toggle
      ;;
esac
