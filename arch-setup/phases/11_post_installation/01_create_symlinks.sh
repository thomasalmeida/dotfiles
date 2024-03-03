#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Creating symbolic links for configurations
print_msg "blue" "::" "Creating symbolic links for dotfiles configurations..."
local dotfiles_path="$HOME/dotfiles"
declare -A configs=(
  ["$dotfiles_path/fish/"]="$HOME/.config/fish/"
  ["$dotfiles_path/hypr/"]="$HOME/.config/hypr/"
  ["$dotfiles_path/lf/"]="$HOME/.config/lf/"
  ["$dotfiles_path/wlogout/"]="$HOME/.config/wlogout/"
  ["$dotfiles_path/btop/"]="$HOME/.config/btop/"
  ["$dotfiles_path/icons/"]="$HOME/.config/icons/"
  ["$dotfiles_path/neofetch/"]="$HOME/.config/neofetch/"
  ["$dotfiles_path/starship/starship.toml"]="$HOME/.config/starship.toml"
  ["$dotfiles_path/wofi/"]="$HOME/.config/wofi/"
  ["$dotfiles_path/dunst/"]="$HOME/.config/dunst/"
  ["$dotfiles_path/gtk-3.0/"]="$HOME/.config/gtk-3.0/"
  ["$dotfiles_path/alacritty/"]="$HOME/.config/alacritty/"
  ["$dotfiles_path/nvim/"]="$HOME/.config/nvim/"
  ["$dotfiles_path/vim/vimrc"]="$HOME/.vimrc"
  ["$dotfiles_path/swaylock/"]="$HOME/.config/swaylock/"
  ["$dotfiles_path/waybar/"]="$HOME/.config/waybar/"
)

for src in "${!configs[@]}"; do
  dest="${configs[$src]}"
  if [[ -e "$dest" ]]; then
    print_msg "yellow" "!!" "$dest already exists. Skipping..."
  else
    ln -s "$src" "$dest"
    error_check "Linking $src to $dest"
  fi
done

# Fonts
if [ ! -e "$HOME/.local/share/fonts" ]; then
  ln -s "$dotfiles_path/fonts/" "$HOME/.local/share/"
  error_check "Linking fonts to .local/share/fonts/"
else
  print_msg "blue" "::" ".local/share/fonts link already exists. Skipping."
fi
