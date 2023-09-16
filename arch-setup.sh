#!/bin/bash

# Utility functions for colored outputs
print_msg() {
    # Color codes
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    BLUE='\033[0;34m'
    NC='\033[0m' # No Color

    local color="$1"
    local symbol="$2"
    local msg="$3"

    case $color in
        "red")    echo -e "${RED}${symbol} ${msg}${NC}";;
        "green")  echo -e "${GREEN}${symbol} ${msg}${NC}";;
        "blue")   echo -e "${BLUE}${symbol} ${msg}${NC}";;
        *)        echo "${msg}";;
    esac
}

# Check if a package is installed
pkg_is_installed() {
    yay -Qq $1 &> /dev/null
    return $?
}

# Check and install function
check_and_install() {
    if pkg_is_installed $1; then
        print_msg "blue" "::" "$1 is already installed."
    else
        yay -S --noconfirm $1
        if [[ $? -eq 0 ]]; then
            print_msg "green" "->" "$1 installed successfully."
        else
            print_msg "red" "!!" "Error installing $1."
        fi
    fi
}

# Function to handle errors
error_check() {
    if [[ $? -ne 0 ]]; then
        print_msg "red" "!!" "An error occurred during the operation: $1. Exiting..."
        exit 1
    fi
}

# Function to configure pacman
configure_pacman() {
    print_msg "blue" "::" "Configuring pacman..."
    sudo sed -i 's/#Color/Color/' /etc/pacman.conf
    sudo sed -i '/#ParallelDownloads = 5/a ParallelDownloads = 10' /etc/pacman.conf
    sudo sed -i 's/#VerbosePkgLists/ILoveCandy/' /etc/pacman.conf
    print_msg "green" "->" "pacman configured successfully."
}

# Function to configure systemd-boot
configure_systemd_boot() {
    print_msg "blue" "::" "Configuring systemd-boot..."
    sudo sed -i 's/timeout .*/timeout 0/' /boot/loader/loader.conf
    for entry in /boot/loader/entries/*.conf; do
        sudo sed -i 's/quiet//' "$entry"
    done
    print_msg "green" "->" "systemd-boot configured successfully."
}

# Function to setup Yay
setup_yay() {
    # Install git if ! already installed
    if ! pacman -Q git > /dev/null 2>&1; then
        echo "Installing Git..."
        check_and_install git
        error_check
        echo "Git installed successfully."
    else
        echo "Git is already installed."
    fi

    if ! command -v yay &>/dev/null; then
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
        print_msg "green" "->" "Yay installed successfully."
    else
        print_msg "blue" "::" "Yay is already installed."
    fi
}

# Function to install essential tools
install_essential_tools() {
    print_msg "blue" "::" "Installing essential tools..."
    check_and_install wget curl vim neofetch base-devel git fish starship pipewire pipewire-media-session pipewire-alsa pipewire-pulse x86-video-intel blueman gtkmm3 jsoncpp libinput libsigc++ wayland-protocols wlroots
    print_msg "green" "->" "Essential tools installed."
}

# Function to install desktop environment and appearance tools
install_desktop_env_tools() {
    echo "Installing desktop environment tools and appearance packages..."
    check_and_install hyprland-git waybar-hyprland wofi dunst kitty swaybg swayidle brightnessctl pavucontrol thunar grim slurp network-manager-applet gedit xdg-desktop-portal-hyprland polkit-gnome qt6-wayland xdotool brave-bin
    echo "Desktop environment tools and appearance packages installed."
}

# Function to install multimedia and sound packages
install_multimedia_tools() {
    echo "Installing multimedia and sound packages..."
    check_and_install pipewire-enable-bluez5
    echo "Multimedia and sound packages installed."
}

# Function to install development tools
install_dev_tools() {
    echo "Installing development tools..."
    check_and_install docker docker-compose vscodium dbeaver postman-bin git-cola insomnia
    echo "Development tools installed."
}

# Function to install fonts
install_fonts() {
    print_msg "blue" "::" "Installing fonts..."

    # Check if Font Awesome is already installed
    if fc-list | grep -q "Font Awesome"; then
        print_msg "blue" "::" "Font Awesome is already installed."
    else
        check_and_install ttf-font-awesome
        fc-cache -f -v > /dev/null 2>&1
        print_msg "green" "->" "Font Awesome installed."
    fi

    # Check if JetBrains Mono Nerd is already installed
    if fc-list | grep -q "JetBrainsMono Nerd Font"; then
        print_msg "blue" "::" "JetBrains Mono Nerd Font is already installed."
    else
        check_and_install ttf-jetbrains-mono-nerd
        fc-cache -f -v > /dev/null 2>&1
        print_msg "green" "->" "JetBrains Mono Nerd Font installed."
    fi
}

# Function to install utilities
install_utilities() {
    echo "Installing utilities..."
    check_and_install btop lf
    echo "Utilities installed."
}

# Function to install extra software
install_extra_software() {
    echo "Installing extra software..."
    check_and_install zoom virt-manager
    echo "Extra software installed."
}

# Function to setup Oh My Fish and theme
setup_oh_my_fish() {
    print_msg "blue" "::" "Setting up Fish Shell..."
    chsh -s /usr/bin/fish

    print_msg "blue" "::" "Installing Oh My Fish..."

    # Verify if the omf is installed
    if ! fish -c "type omf" &>/dev/null; then
        fish -c "curl -L https://get.oh-my.fish | fish" &>/dev/null
        sleep 5
        if fish -c "type omf" &>/dev/null; then
            print_msg "green" "->" "Oh My Fish installed successfully."
        else
            print_msg "red" "!!" "Failed to install Oh My Fish."
            return 1
        fi
    else
        print_msg "blue" "::" "Oh My Fish is already installed."
    fi

    # Verify if the theme is installed
    if fish -c "omf list" | grep -q "catppuccin"; then
        print_msg "blue" "::" "Catppuccin theme is already installed for Oh My Fish."
    else
        fish -c "omf install https://github.com/catppuccin/fish" > /dev/null 2>&1
        error_check "Installing Catppuccin theme for Oh My Fish"
        print_msg "green" "->" "Catppuccin theme installed for Oh My Fish."
    fi
}


# Function to setup ASDF
setup_asdf() {
    print_msg blue "::" "Setting up ASDF and installing Go, Ruby, and Node..."

    # Verify if ASDF is not already installed
    if ! [ -d "$HOME/.asdf" ]; then
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
        
        # Add to fish configuration
        # echo "source ~/.asdf/asdf.fish" >> ~/.config/fish/config.fish

        # Setup completions using symbolic link as per recommendation
        mkdir -p ~/.config/fish/completions
        ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
    else
        print_msg yellow "!!" "asdf is already installed via Git."
    fi

    # Install plugins and languages
    if ! asdf plugin-list | grep -q golang; then
        asdf plugin-add golang
        asdf install golang latest
        latest_version=$(asdf list golang | tail -1)
        asdf global golang $latest_version
    fi

    if ! asdf plugin-list | grep -q ruby; then
        asdf plugin-add ruby
        asdf install ruby latest
        latest_version=$(asdf list ruby | tail -1)
        asdf global ruby $latest_version
    fi

    if ! asdf plugin-list | grep -q nodejs; then
        asdf plugin-add nodejs
        bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
        asdf install nodejs latest
        latest_version=$(asdf list nodejs | tail -1)
        asdf global nodejs $latest_version
    fi

    print_msg green "->" "Go, Ruby, and Node installed using ASDF."
}

setup_vscodium_from_profile() {
    local profile_path="dotfiles/VSCodium/tom.code-profile"

    print_msg blue "::" "Setting up VSCodium profile from $profile_path..."

    # User Settings
    jq -r '.settings' "$profile_path" | jq -r .settings > ~/.config/VSCodium/User/settings.json

    # Keybindings
    jq -r '.keybindings' "$profile_path" | jq -r .keybindings > ~/.config/VSCodium/User/keybindings.json

    # Extensions
    extensions=$(jq -r '.extensions[].identifier.id' "$profile_path")
    for extension in $extensions; do
        codium --install-extension $extension
    done

    print_msg green "->" "VSCodium profile set up from $profile_path."
}

# Function to install and configure browser flags
setup_browser_flags() {
    print_msg "blue" "::" "Making the flag modifications persistent for Chromium, Brave, and VSCodium..."

    # Ensure the applications directory exists
    mkdir -p ~/.local/share/applications/

    # For Chromium
    cp /usr/share/applications/chromium.desktop ~/.local/share/applications/
    sed -i 's|Exec=/usr/bin/chromium %U|Exec=/usr/bin/chromium --ozone-platform-hint=wayland --force-dark-mode --enable-features=WebUIDarkMode --ignore-gpu-blocklist --enable-gpu-rasterization --enable-zero-copy --gtk-version=4 %U|' ~/.local/share/applications/chromium.desktop

    # For Brave
    cp /usr/share/applications/brave-browser.desktop ~/.local/share/applications/
    sed -i 's|Exec=/usr/bin/brave-browser-stable %U|Exec=/usr/bin/brave-browser-stable --ozone-platform-hint=wayland --force-dark-mode --enable-features=WebUIDarkMode --ignore-gpu-blocklist --enable-gpu-rasterization --enable-zero-copy --gtk-version=4 %U|' ~/.local/share/applications/brave-browser.desktop

    # For VSCodium
    cp /usr/share/applications/vscodium.desktop ~/.local/share/applications/
    sed -i 's|Exec=/usr/bin/codium --no-sandbox %F|Exec=/usr/bin/codium --no-sandbox --ozone-platform-hint=wayland --force-dark-mode --enable-features=WebUIDarkMode --ignore-gpu-blocklist --enable-gpu-rasterization --enable-zero-copy --gtk-version=4 %F|' ~/.local/share/applications/vscodium.desktop

    print_msg "green" "->" "Flags added to Chromium, Brave, and VSCodium launchers."
}


# Function to install and setup TimeShift
setup_timeshift() {
    print_msg "blue" "::" "Installing TimeShift..."
    check_and_install timeshift

    # Setting up TimeShift (this is a basic setup, you might want to adjust settings according to your needs)
    sudo timeshift --create --comments "Initial Snapshot" --tags D
    print_msg "green" "->" "Initial TimeShift snapshot created."
}

# Function to install and configure Git
setup_git() {
    print_msg "blue" "::" "Configuring Git..."

    if ! command -v git &>/dev/null; then
        print_msg "red" "!!" "Git not installed. Exiting..."
        exit 1
    fi

    # Check if Git name is already set
    if [[ -z $(git config --global user.name) ]]; then
        read -p "Please enter your Git name: " git_name
        git config --global user.name "$git_name"
        error_check "Setting up Git name"
    fi

    # Check if Git email is already set
    if [[ -z $(git config --global user.email) ]]; then
        read -p "Please enter your Git email: " git_email
        git config --global user.email "$git_email"
        error_check "Setting up Git email"
    fi

    print_msg "green" "->" "Git has been configured with the provided name and email."
}

# Function to create symbolic links for configurations
create_symlinks() {
    print_msg "blue" "::" "Creating symbolic links for dotfiles configurations..."

    local dotfiles_path="$HOME/dotfiles" # Change to your dotfiles repository path if different

    # List of configurations and their destinations
    declare -A configs=(
        ["$dotfiles_path/fish/"]="$HOME/.config/fish/"
        ["$dotfiles_path/hypr/"]="$HOME/.config/hypr/"
        ["$dotfiles_path/lf/"]="$HOME/.config/lf/"
        ["$dotfiles_path/wlogout/"]="$HOME/.config/wlogout/"
        ["$dotfiles_path/btop/"]="$HOME/.config/btop/"
        ["$dotfiles_path/icons/"]="$HOME/.config/icons/"
        ["$dotfiles_path/neofetch/"]="$HOME/.config/neofetch/"
        ["$dotfiles_path/starship.toml"]="$HOME/.config/starship.toml"
        ["$dotfiles_path/wofi/"]="$HOME/.config/wofi/"
        ["$dotfiles_path/dunst/"]="$HOME/.config/dunst/"
        ["$dotfiles_path/gtk-3.0/"]="$HOME/.config/gtk-3.0/"
        ["$dotfiles_path/kitty/"]="$HOME/.config/kitty/"
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
}

# Main execution starts here

# Update system
print_msg "blue" "::" "Updating system..."
yay -Syyu --noconfirm
error_check

# Call functions to perform tasks
# List of functions to call in order
functions_to_call=(
    configure_pacman
    configure_systemd_boot
    setup_git
    setup_asdf
    setup_vscodium_from_profile
    setup_yay
    install_essential_tools
    install_desktop_env_tools
    install_multimedia_tools
    install_dev_tools
    install_fonts
    install_utilities
    install_extra_software
    setup_oh_my_fish
    setup_browser_flags
    # setup_timeshift
    create_symlinks
)

# Loop through the functions and call them
for func in "${functions_to_call[@]}"; do
    $func
    error_check "$func"
done

# Enabling and starting the NetworkManager service for network management
print_msg "blue" "::" "Enabling and starting NetworkManager service..."
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service
print_msg "green" "->" "NetworkManager service enabled and started."

print_msg "green" "->" "All done! You might need to manually handle additional configurations mentioned in the README that this script didn't cover, especially copying specific files to directories."
print_msg "blue" "::" "It's recommfied to restart your machine to ensure all changes are applied correctly."
