#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Setting up Yay (Yet Another Yaourt)
print_msg "blue" "::" "Setting up Yay..."
if ! command -v yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay.git
  if [[ $? -ne 0 ]]; then
    print_msg "red" "!!" "Failed to clone Yay repository. Exiting..."
    exit 1
  fi

  cd yay
  makepkg -si --noconfirm
  if [[ $? -ne 0 ]]; then
    print_msg "red" "!!" "Failed to build and install Yay. Exiting..."
    exit 1
  fi

  cd ..
  rm -rf yay
  print_msg "green" "->" "Yay installed successfully."
else
  print_msg "blue" "::" "Yay is already installed."
fi
