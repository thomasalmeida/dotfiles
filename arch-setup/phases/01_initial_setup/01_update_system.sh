#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Updating the system
print_msg "blue" "::" "Updating system..."
sudo pacman -Syyu --noconfirm
if [[ $? -ne 0 ]]; then
  print_msg "red" "!!" "An error occurred during the system update. Exiting..."
  exit 1
fi
print_msg "green" "->" "System updated successfully."
