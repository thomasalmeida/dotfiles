#!/bin/bash

swayidle -w timeout 300 'swaylock -C ~/.config/swaylock/config' \
            timeout 600 'hyprctl dispatch dpms off' \
            timeout 900 'systemctl suspend' \
            resume 'hyprctl dispatch dpms on' \
            before-sleep 'sswaylock -C ~/.config/swaylock/config' &
