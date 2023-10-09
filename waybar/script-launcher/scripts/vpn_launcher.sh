#!/bin/bash

# Directory containing .ovpn files
VPN_DIR="/etc/openvpn"

# Use wofi to select a VPN from the available .ovpn files
# and store the selected VPN name in the variable SELECTED_VPN
SELECTED_VPN=$(ls $VPN_DIR/*.ovpn | xargs -n 1 basename | wofi -w 3 -n --dmenu --prompt="Select a VPN to connect:")

# Check if a VPN was selected
if [ -n "$SELECTED_VPN" ]; then
  # Open Brave browser
  # brave https://myapps.microsoft.com/ --tile &
  brave --headless --remote-debugging-port=9222 --disable-gpu https://myapps.microsoft.com/ &
  BRAVE_PID=$!

  # Notify the user that the VPN is connecting
  notify-send "VPN Connection" "Connecting to $SELECTED_VPN..."

  # Start the VPN connection
  openvpn3 session-start --config "$VPN_DIR/$SELECTED_VPN"

  # Wait for the VPN to connect
  while ! openvpn3 sessions-list | grep -q "Session Path: /net/openvpn/v3/sessions/"; do
      sleep 1
  done

  # Notify the user that the VPN is connected
  notify-send "VPN Connection" "$SELECTED_VPN connected!"

  # Kill the specific Brave instance
  kill $BRAVE_PID
else
  # Notify the user that no VPN was selected
  notify-send "VPN Connection" "No VPN selected."
fi


