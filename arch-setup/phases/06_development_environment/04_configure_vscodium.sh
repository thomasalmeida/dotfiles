#!/bin/bash

# Configure VSCodium
print_msg "blue" "::" "Configuring VSCodium..."

# Path to the user's VSCodium configuration directory
vscodium_config_dir="$HOME/.config/VSCodium"

# Path to the dotfiles VSCodium configuration
dotfiles_vscodium_config="$HOME/dotfiles/VSCodium/User"

# Create symbolic links for VSCodium configurations
if [ -d "$vscodium_config_dir" ]; then
  ln -sfn "$dotfiles_vscodium_config" "$vscodium_config_dir/User"
  print_msg "green" "->" "VSCodium configurations linked."
else
  print_msg "red" "!!" "VSCodium configuration directory not found."
fi

# Install VSCodium extensions
if python3 "$HOME/dotfiles/VSCodium/install_extensions.py"; then
  print_msg "green" "->" "VSCodium extensions installed."
else
  print_msg "red" "!!" "Error installing VSCodium extensions."
  exit 1
fi

print_msg "green" "->" "VSCodium configuration completed."
