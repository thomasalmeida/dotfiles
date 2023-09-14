# Arch Linux: Tailored Configuration Guide

Welcome! This guide offers a detailed configuration script for Arch Linux, molded to fit specific preferences and work processes. The main aim of this script is to provide an efficient setup experience, reducing the manual efforts and streamlining the Arch Linux configuration.

## Prerequisites

1. **Arch Linux Installation**: This script is designed exclusively for Arch Linux. Make sure it's your running distribution.

2. **Git**: Ensure Git is installed before you begin. If not, use the following command:

   ```bash
   sudo pacman -S git
   ```

3. **Script Permissions**: The script should have execution rights. If you've recently cloned the repository or fetched the script, grant it the necessary permissions:

   ```bash
   chmod +x arch-setup.sh
   ```

   If the script's filename differs, replace `arch-setup.sh` with the correct name.

## Usage Instructions

1. Clone the repository or download the script to your computer.

2. In the terminal, navigate to the directory where the script resides.

3. Launch the script:

   ```bash
   ./arch-setup.sh
   ```

   Remember to use the actual script's filename if it's not `arch-setup.sh`.

4. Follow the prompts and patiently wait as the script runs its course.

## Overview: Script Features

The configuration script performs several tasks to streamline your Arch Linux setup:

1. **AUR Helper**: Installs Yay, simplifying software installations from the AUR.

2. **Software & Package Installation**:
   
   - **Essential Tools**: `wget`, `curl`, `vim`, `neofetch`, `git`, `fish`, `starship`, `pipewire`, `pipewire-media-session`, `pipewire-alsa`, `pipewire-pulse`, `pipewire-jack`, `x86-video-intel`.
   
   - **Desktop Environment & Appearance Tools**: `hyprland-git`, `waybar-hyprland`, `wofi`, `dunst`, `kitty`, `swaybg`, `swayidle`, `brightnessctl`, `pavucontrol`, `thunar`, `grim`, `slurp`, `network-manager-applet`, `gedit`, `xdg-desktop-portal-hyprland`, `polkit-gnome`, `qt6-wayland`, `xdotool`, `brave-bin`.
   
   - **Multimedia & Sound Packages**: `pipewire-enable-bluez5`.
   
   - **Development Tools**: `docker`, `docker-compose`, `asdf-vm`, `vscodium`, `dbeaver`, `postman-bin`, `git-cola`, `insomnia`.
   
   - **Fonts**: `ttf-font-awesome`.
   
   - **Utilities**: `btop`, `lf`.
   
   - **Additional Software**: `zoom`, `virt-manager`.

3. **Shell Configuration**: Sets the default shell to Fish, accompanied by additional customizations.

4. **Development Environment Setup**: Configures the dev environment, inclusive of the ASDF tool for version management for Go, Ruby, and Node.

5. **Custom Configurations**: Symbolic links are created for custom settings for various applications and utilities from a `dotfiles` directory.

6. **General System Enhancements**: Additional tweaks to refine the system for immediate use.

7. **Git configuration**: Asks for your Git name and email, and then configures Git with this information.

## Feedback & Collaborations

Constructive feedback, suggestions, or enhancements are always welcome! Please open an issue or make a pull request if you'd like to contribute. As this is an ever-evolving project, contributions aimed at enhancing it are highly appreciated.

---

Best wishes for your Arch Linux configuration journey! Here's hoping this script enhances your setup experience.