#!/bin/bash

# Define the directory containing the scripts
SCRIPT_DIR=$HOME/dotfiles/waybar/launcher

# Define the path to the scripts list
SCRIPTS_LIST=$SCRIPT_DIR/scripts_list.json

# Use wofi to select a script from the available scripts in the directory
SELECTED=$(jq -r '.[] | .icon + " " + .description' $SCRIPTS_LIST | wofi -w 1 -n --prompt="Select a script to run:" --dmenu)

# Check if a script was selected
if [ -n "$SELECTED" ]; then
  # Extract the script path and sudo requirement from the selection
  SCRIPT_PATH=$(jq -r --arg sel "$SELECTED" '.[] | select(.icon + " " + .description == $sel) | .path' $SCRIPTS_LIST)
  REQUIRES_SUDO=$(jq -r --arg sel "$SELECTED" '.[] | select(.icon + " " + .description == $sel) | .sudo' $SCRIPTS_LIST)

  $SCRIPT_DIR/$SCRIPT_PATH
fi
