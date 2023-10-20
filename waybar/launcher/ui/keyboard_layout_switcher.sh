#!/bin/bash

# Caminho para o arquivo de configuração do Hyprland
CONFIG_FILE=~/dotfiles/hypr/hyprland.conf

# Opções de layout para serem exibidas no wofi
OPTIONS="BR ABNT2\nUS INTL"

# Usar wofi para selecionar um layout
SELECTED=$(echo -e $OPTIONS | wofi -w 3 -n --prompt="Select a keyboard layout:" --dmenu)

# Função para alterar o layout do teclado e notificar o usuário
change_layout() {
  sed -i "s/kb_layout=.*$/kb_layout=$1/" "$CONFIG_FILE"
  sed -i "s/kb_variant=.*$/kb_variant=$2/" "$CONFIG_FILE"
  notify-send "Keyboard Layout Switcher" "Switched to: $3"
}

# Verificar qual layout foi selecionado e ajustar o arquivo de configuração
case $SELECTED in
    "BR ABNT2")
      change_layout "br" "abnt2" "BR ABNT2"
      ;;
    "US INTL")
      change_layout "us" "intl" "US INTL"
      ;;
    *)
      notify-send "Keyboard Layout Switcher" "No changes made."
      ;;
esac
