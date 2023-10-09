#!/bin/bash

# Define the directory containing the scripts
SCRIPT_DIR=~/dotfiles/waybar/script-launcher/scripts

# Define the path to the scripts list
SCRIPTS_LIST=~/dotfiles/waybar/script-launcher/scripts_list.txt

# Use wofi to select a script from the available scripts in the directory
# and store the selected script name in the variable SCRIPT
SELECTED=$(awk -F, '{print $1 $2}' $SCRIPTS_LIST | wofi -w 3 -n --prompt="Select a script to run:" --dmenu)

# Check if a script was selected
if [ -n "$SELECTED" ]; then
  # Extract the script filename from the selection and execute it
  SCRIPT_NAME=$(awk -F, -v sel="$SELECTED" '$1 $2 == sel {print $3}' $SCRIPTS_LIST | xargs)
  $SCRIPT_DIR/$SCRIPT_NAME
fi
