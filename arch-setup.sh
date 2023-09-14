#!/bin/bash

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

# Function to handle errors
error_check() {
    if [[ $? -ne 0 ]]; then
        echo "An error occurred during the operation: $1. Exiting..."
        exit 1
    fi
}

# Function to configure pacman
configure_pacman() {
    echo "Configuring pacman..."
    sed -i 's/#Color/Color/' /etc/pacman.conf
    sed -i '/#ParallelDownloads = 5/a ParallelDownloads = 10' /etc/pacman.conf
    sed -i 's/#VerbosePkgLists/ILoveCandy/' /etc/pacman.conf
    echo "pacman configured successfully."
}

# Function to configure systemd-boot
configure_systemd_boot() {
    echo "Configuring systemd-boot..."
    sed -i 's/timeout .*/timeout 0/' /boot/loader/loader.conf
    for entry in /boot/loader/entries/*.conf; do
        sed -i 's/quiet//' "$entry"
    done
    echo "systemd-boot configured successfully."
}

# Function to setup Yay
setup_yay() {
    echo "Setting up Yay..."
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit
    makepkg -si --noconfirm
    cd .. || exit
    rm -rf yay
    echo "Yay setup complete."
}

# Function to install essential tools
install_essential_tools() {
    echo "Installing essential tools..."
    yay -S --noconfirm wget curl vim neofetch git fish starship pipewire pipewire-media-session pipewire-alsa pipewire-pulse pipewire-jack x86-video-intel
    echo "Essential tools installed."
}

# Function to install desktop environment and appearance tools
install_desktop_env_tools() {
    echo "Installing desktop environment tools and appearance packages..."
    yay -S --noconfirm hyprland-git waybar-hyprland wofi dunst kitty swaybg swayidle brightnessctl pavucontrol thunar grim slurp network-manager-applet gedit xdg-desktop-portal-hyprland polkit-gnome qt6-wayland xdotool brave-bin
    echo "Desktop environment tools and appearance packages installed."
}

# Function to install multimedia and sound packages
install_multimedia_tools() {
    echo "Installing multimedia and sound packages..."
    yay -S --noconfirm pipewire-enable-bluez5
    echo "Multimedia and sound packages installed."
}

# Function to install development tools
install_dev_tools() {
    echo "Installing development tools..."
    yay -S --noconfirm docker docker-compose asdf-vm vscodium dbeaver postman-bin git-cola insomnia
    echo "Development tools installed."
}

# Function to install fonts
install_fonts() {
    echo "Installing fonts..."
    yay -S --noconfirm ttf-font-awesome
    mkdir -p ~/.local/share/fonts
    fc-cache -f -v
    echo "Fonts installed."
}

# Function to install utilities
install_utilities() {
    echo "Installing utilities..."
    yay -S --noconfirm btop lf
    echo "Utilities installed."
}

# Function to install extra software
install_extra_software() {
    echo "Installing extra software..."
    yay -S --noconfirm zoom virt-manager
    echo "Extra software installed."
}

# Function to setup Oh My Fish and theme
setup_oh_my_fish() {
    echo "Installing Oh My Fish..."
    fish -c "curl -L https://get.oh-my.fish | fish"
    sleep 5
    fish -c "omf install catppuccin"
    echo "Oh My Fish and Catppuccin theme installed."
}

# Function to setup ASDF
setup_asdf() {
    echo "Setting up ASDF and installing Go, Ruby, and Node..."
    pacman -S --noconfirm asdf-vm
    source /opt/asdf-vm/asdf.fish
    # Go
    asdf plugin-add go
    asdf install go latest
    asdf global go $(asdf list go | tail -1)
    # Ruby
    asdf plugin-add ruby
    asdf install ruby latest
    asdf global ruby $(asdf list ruby | tail -1)
    # Node
    asdf plugin-add nodejs
    bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
    asdf install nodejs latest
    asdf global nodejs $(asdf list nodejs | tail -1)
    echo "Go, Ruby, and Node installed using ASDF."
}

# Function to set up Fish Shell and other configurations
setup_shell() {
    echo "Setting up Fish Shell..."
    chsh -s /usr/bin/fish
    echo "Configuring StarShip..."
    echo 'starship init fish | source' >> ~/.config/fish/config.fish
    echo 'set fish_greeting' >> ~/.config/fish/config.fish
    echo 'neofetch' >> ~/.config/fish/config.fish
    echo "Configuring ASDF for Fish..."
    echo 'source /opt/asdf-vm/asdf.fish' >> ~/.config/fish/config.fish
}

# Function to install and configure browser flags
setup_browser_flags() {
    yay -S --noconfirm chromium-l10n

    echo "Making the flag modifications persistent for Chromium, Brave, and VSCodium..."

    # For Chromium
    cp /usr/share/applications/chromium.desktop ~/.local/share/applications/
    sed -i 's|Exec=/usr/bin/chromium %U|Exec=/usr/bin/chromium --ozone-platform-hint=wayland --force-dark-mode --enable-features=WebUIDarkMode --ignore-gpu-blocklist --enable-gpu-rasterization --enable-zero-copy --gtk-version=4 %U|' ~/.local/share/applications/chromium.desktop

    # For Brave
    cp /usr/share/applications/brave-browser.desktop ~/.local/share/applications/
    sed -i 's|Exec=/usr/bin/brave-browser-stable %U|Exec=/usr/bin/brave-browser-stable --ozone-platform-hint=wayland --force-dark-mode --enable-features=WebUIDarkMode --ignore-gpu-blocklist --enable-gpu-rasterization --enable-zero-copy --gtk-version=4 %U|' ~/.local/share/applications/brave-browser.desktop

    # For VSCodium
    cp /usr/share/applications/vscodium.desktop ~/.local/share/applications/
    sed -i 's|Exec=/usr/bin/codium --no-sandbox %F|Exec=/usr/bin/codium --no-sandbox --ozone-platform-hint=wayland --force-dark-mode --enable-features=WebUIDarkMode --ignore-gpu-blocklist --enable-gpu-rasterization --enable-zero-copy --gtk-version=4 %F|' ~/.local/share/applications/vscodium.desktop

    echo "Flags added to Chromium, Brave, and VSCodium launchers."
}

# Function to install and setup TimeShift
setup_timeshift() {
    echo "Installing TimeShift..."
    yay -S --noconfirm timeshift
    echo "TimeShift installed."

    # Setting up TimeShift (this is a basic setup, you might want to adjust settings according to your needs)
    sudo timeshift --create --comments "Initial Snapshot" --tags D
    echo "Initial TimeShift snapshot created."
}

# Main execution starts here

# Update system
echo "Updating system..."
pacman -Syu --noconfirm
error_check

# Install git if not already installed
if ! command -v git &> /dev/null; then
    echo "Installing Git..."
    pacman -S --noconfirm git
    error_check
    echo "Git installed successfully."
fi

# Call functions to perform tasks
# List of functions to call in order
functions_to_call=(
    configure_pacman
    configure_systemd_boot
    setup_asdf
    setup_yay
    install_essential_tools
    install_desktop_env_tools
    install_multimedia_tools
    install_dev_tools
    install_fonts
    install_utilities
    install_extra_software
    setup_oh_my_fish
    setup_shell
    setup_browser_flags
    # setup_timeshift
)

# Loop through the functions and call them
for func in "${functions_to_call[@]}"; do
    $func
    error_check "$func"
done

# Prompt for Git configuration
read -p "Please enter your Git name: " git_name
read -p "Please enter your Git email: " git_email

# Set Git configurations
error_check git config --global user.name "$git_name"
error_check git config --global user.email "$git_email"

echo "Git has been configured with the provided name and email."

echo "All done! You might need to manually handle additional configurations mentioned in the README that this script didn't cover, especially copying specific files to directories."
echo "It's recommended to restart your machine to ensure all changes are applied correctly."
