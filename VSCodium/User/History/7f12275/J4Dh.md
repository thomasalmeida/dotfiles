## Installation

- Install requirement packages :  
```shell
yay -S hyprland-git waybar-hyprland wofi dunst kitty swaybg swayidle  brightnessctl pavucontrol thunar grim slurp network-manager-applet lf neovim cava btop neofetch gedit wget curl pulseaudio x86-video-intel brave-bin xdg-desktop-portal-hyprland polkit-gnome qt6-wayland
```
- Copy all file to ``` ~/.config/```


## Install Fonts

- Awesome font : ``` yay -S ttf-font-awesome ```
- Copy all file ```.ttf``` to ```~/.local/share/fonts``` then run command ```fc-cache -f -v```

## SHELL Setups

- Install [Fish shell](https://fishshell.com/) :
```shell
 pacman -S fish 
 ```
 - Change default shell to ```fish```:
 ```shell
    chsh -s /usr/bin/fish
 ```
- Install [Oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) and [themes](https://github.com/catppuccin/fish) , [exa icons] (https://the.exa.website/install)

- Install [StarShip Prompt](https://starship.rs/guide/#%F0%9F%9A%80-installation)
 ```shell
 pacman -S starship
 ```
- Add this command to ```~/.config/fish/config.fish```
```shell

starship init fish | source
set fish_greeting
neofetch

```
- Copy file ```starship.toml ``` to ```~/.config/```

## Dev

```shell
yay -S docker docker-compose asdf-vm vscodium dbeaver postman-bin git-cola insomnia
```

Add the following to ~/.config/fish/config.fish:

```shell
source /opt/asdf-vm/asdf.fish
```
Completions are automatically configured on installation by the AUR package.

## Extra

```shell
yay -S zoom virt-manager
```