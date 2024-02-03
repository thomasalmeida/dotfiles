#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Installing fonts
print_msg "blue" "::" "Installing fonts..."

# List of font packages to install
font_packages=(
  "ttf-font-awesome"
  "ttf-jetbrains-mono-nerd"
  "noto-fonts"
  "noto-fonts-emoji"
)

# Iterate and install fonts
for font_package in "${font_packages[@]}"; do
check_and_install "$font_package"
  fc-cache -f -v
  print_msg "green" "->" "$font_package installed."
done

print_msg "green" "->" "All specified fonts installed."
