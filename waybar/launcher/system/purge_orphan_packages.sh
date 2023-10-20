#!/bin/bash

# Source the common functions
source ~/dotfiles/waybar/launcher/common/functions.sh

# purge_orphan_packages.sh
# Script to remove orphan packages using yay

# Get the list of orphan packages
ORPHAN_PACKAGES=$(yay -Qtdq)

# Check if there are any orphan packages
if [ -z "$ORPHAN_PACKAGES" ]; then
  # If there are no orphan packages, notify the user
  send_notification "System Cleanup" "No orphan packages to remove."
else
  # If there are orphan packages, remove them and check the exit status
  yay -Rns $ORPHAN_PACKAGES
  EXIT_STATUS=$?

  # Notify the user based on the exit status
  if [ $EXIT_STATUS -eq 0 ]; then
    send_notification "System Cleanup" "Orphan packages have been successfully removed."
  else
    send_notification "System Cleanup" "Failed to remove orphan packages. Check terminal for details."
  fi
fi
