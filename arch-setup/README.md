# Arch Linux: Tailored Configuration Guide

Welcome to the Arch Linux Tailored Configuration Guide! This guide provides a comprehensive script designed to streamline the configuration process for Arch Linux, tailored to fit specific preferences and workflows. The primary goal is to offer an efficient and automated setup experience, minimizing manual effort and maximizing productivity.

## Prerequisites

1. **Arch Linux Installation**: This script is intended for use with Arch Linux. Ensure you have Arch Linux installed on your system.

2. **Git**: Git is required for the initial setup. If it's not installed, you can install it using:

   ```bash
   sudo pacman -S git
   ```

3. **Script Permissions**: Ensure the script has execution permissions. If you've downloaded or cloned it recently, set the necessary permissions using:
   ```bash
   chmod +x arch-setup.sh
   ```
   Replace `arch-setup.sh` with the actual filename, if different.

## Usage Instructions

1. Clone the repository or download the script to your Arch Linux system.

2. Open a terminal and navigate to the directory containing the script.

3. Execute the script:

   ```bash
   ./arch-setup/main.sh
   ```

4. The script will prompt you to select specific phases to execute. You can choose individual phases or run all of them.

## Script Overview

The configuration script is organized into modular phases, each performing specific tasks:

1. **Initial Setup**: Updates the system and configures pacman and systemd-boot.

2. **Git Setup**: Installs and configures Git.

3. **Package Management**: Sets up Yay (AUR Helper) and installs essential tools.

4. **Desktop Environment**: Installs desktop environment tools and appearance packages.

5. **Multimedia Tools**: Installs multimedia and sound packages.

6. **Development Environment**: Installs development tools and sets up the ASDF version manager.

7. **Fonts and Themes**: Installs fonts and sets up the Fish shell with Oh My Fish and the Catppuccin theme.

8. **Utilities and Extras**: Installs additional utilities and software.

9. **Shell Setup**: Additional shell configuration.

10. **Browser Flags Configuration**: Sets up browser flags for Chromium, Brave, and VSCodium.

11. **Post Installation**: Creates symbolic links for custom configurations and enables the NetworkManager service.

## Installed Applications and Packages

The script installs a variety of applications and packages, categorized as follows:

- **Essential Tools**: wget, curl, vim, neofetch, git, fish, starship, pipewire, pipewire-media-session, pipewire-alsa, pipewire-pulse, pipewire-jack, x86-video-intel.
- **Desktop Environment Tools**: hyprland-git, waybar-hyprland, wofi, dunst, alacritty, swaybg, swayidle, brightnessctl, pavucontrol, thunar, grim, slurp, network-manager-applet, gedit, xdg-desktop-portal-hyprland, polkit-gnome, qt6-wayland, xdotool, brave-bin.
- **Multimedia and Sound**: pipewire-enable-bluez5.
- **Development Tools**: docker, docker-compose, asdf-vm, vscodium, dbeaver, postman-bin, git-cola, jq.
- **Fonts**: ttf-font-awesome, ttf-jetbrains-mono-nerd.
- **Utilities**: btop.
- **Additional Software**: zoom, virt-manager.

## Feedback and Contributions

Your feedback and contributions are highly valued! If you have suggestions, issues, or would like to contribute to the project, please feel free to open an issue or submit a pull request. This project is continually evolving, and contributions that enhance its functionality are greatly appreciated.

---

We wish you a smooth and efficient Arch Linux configuration experience. May this script make your setup process more enjoyable and productive!
