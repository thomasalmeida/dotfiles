#!/bin/bash

# Path to the Hyprland configuration file
CONFIG_FILE=~/dotfiles/hypr/hyprland.conf

# Layout options to be displayed in wofi
OPTIONS="BR ABNT2\nUS INTL"

# Use wofi to select a layout
SELECTED=$(echo -e $OPTIONS | wofi -w 3 -n --prompt="Select a keyboard layout:" --dmenu)

# Function to change the keyboard layout and notify the user
change_layout() {
  sed -i "s/kb_layout=.*$/kb_layout=$1/" "$CONFIG_FILE"
  sed -i "s/kb_variant=.*$/kb_variant=$2/" "$CONFIG_FILE"
  notify-send "Keyboard Layout Switcher" "Switched to: $3"
}

# Check which layout was selected and adjust the configuration file accordingly
case $SELECTED in
    "BR ABNT2")
      change_layout "br" "abnt2" "BR ABNT2"
      ;;
    "US INTL")
      change_layout "us" "intl" "US INTL"
      ;;
    *)
      notify-send "Keyboard Layout Switcher" "No changes made."
      ;;
esac
