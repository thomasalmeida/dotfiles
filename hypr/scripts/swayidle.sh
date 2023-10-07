#!/bin/bash

set $lock swaylock -c 550000
exec swayidle -w \
  timeout 600 $lock \
  timeout 570 'swaymsg "output * dpms off"' \
  resume 'swaymsg "output * dpms on"' \
  before-sleep $lock
