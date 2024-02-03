#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Installing essential tools
print_msg "blue" "::" "Installing essential tools..."
essential_tools=(
  base-devel
  blueman
  curl
  fish
  git
  gtkmm3
  jsoncpp
  libinput
  libsigc++
  neofetch
  starship
  vim
  wayland-protocols
  wget
  wlroots
  x86-video-intel
)
for tool in "${essential_tools[@]}"; do
  check_and_install "$tool"
done
print_msg "green" "->" "Essential tools installed."
