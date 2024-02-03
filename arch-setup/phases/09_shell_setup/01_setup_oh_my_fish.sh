#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Setting up Oh My Fish and theme
print_msg "blue" "::" "Setting up Fish Shell..."
chsh -s /usr/bin/fish

print_msg "blue" "::" "Installing Oh My Fish..."
if ! fish -c "type omf" &>/dev/null; then
  fish -c "curl -L https://get.oh-my.fish | fish" &>/dev/null
  sleep 5
  if fish -c "type omf" &>/dev/null; then
    print_msg "green" "->" "Oh My Fish installed successfully."
  else
    print_msg "red" "!!" "Failed to install Oh My Fish."
    exit 1
  fi
else
  print_msg "blue" "::" "Oh My Fish is already installed."
fi

if ! fish -c "omf list" | grep -q "catppuccin"; then
  fish -c "omf install https://github.com/catppuccin/fish" &>/dev/null
  error_check "Installing Catppuccin theme for Oh My Fish"
  print_msg "green" "->" "Catppuccin theme installed for Oh My Fish."
else
  print_msg "blue" "::" "Catppuccin theme is already installed for Oh My Fish."
fi
