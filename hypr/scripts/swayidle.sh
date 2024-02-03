#!/bin/bash

LOCK = "swaylock -f ~/.config/swaylock/config"
swayidle -w \
	timeout 300 $LOCK \
  timeout 360 'hyprctl dispatch dpms off' \
  resume 'hyprctl dispatch dpms on' \
	before-sleep 'playerctl pause' \
	before-sleep $LOCK
