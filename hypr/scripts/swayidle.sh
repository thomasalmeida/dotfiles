#!/bin/bash

start_swayidle() {
  swayidle -w \
    timeout 300 'swaylock -C ~/.config/swaylock/config' \
    timeout 600 'hyprctl dispatch dpms off' \
    timeout 900 'systemctl suspend' \
    resume 'hyprctl dispatch dpms on; pkill -f start_swayidle; start_swayidle' \
    before-sleep 'swaylock -C ~/.config/swaylock/config' &
}

start_swayidle
