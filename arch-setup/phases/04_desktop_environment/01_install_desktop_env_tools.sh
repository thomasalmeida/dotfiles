#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Installing desktop environment tools and appearance packages
print_msg "blue" "::" "Installing desktop environment tools and appearance packages..."
desktop_env_tools=(
  brave-bin
  brightnessctl
  chromium
  dunst
  gedit
  grim
  hyprland-git
  alacritty
  network-manager-applet
  pavucontrol
  polkit-gnome
  qt6-wayland
  slurp
  swaybg
  swayidle
  thunar
  waybar
  wofi
  xdg-desktop-portal-hyprland
  xdotool
)
for tool in "${desktop_env_tools[@]}"; do
  check_and_install "$tool"
done
print_msg "green" "->" "Desktop environment tools and appearance packages installed."
