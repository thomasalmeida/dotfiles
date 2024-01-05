#!/bin/bash

# Installing multimedia and sound packages
print_msg "blue" "::" "Installing multimedia and sound packages..."
multimedia_tools=(
  pipewire
  pipewire-alsa
  pipewire-enable-bluez5
  pipewire-media-session
  pipewire-pulse
  spotify
)
for tool in "${multimedia_tools[@]}"; do
  check_and_install "$tool"
done
print_msg "green" "->" "Multimedia and sound packages installed."
