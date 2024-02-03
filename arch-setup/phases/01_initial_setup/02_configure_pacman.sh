#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Configuring pacman
print_msg "blue" "::" "Configuring pacman..."
sudo sed -i 's/#Color/Color/' /etc/pacman.conf
sudo sed -i '/#ParallelDownloads = 5/a ParallelDownloads = 10' /etc/pacman.conf
sudo sed -i 's/#VerbosePkgLists/ILoveCandy/' /etc/pacman.conf
if [[ $? -ne 0 ]]; then
  print_msg "red" "!!" "An error occurred during the pacman configuration. Exiting..."
  exit 1
fi
print_msg "green" "->" "pacman configured successfully."
