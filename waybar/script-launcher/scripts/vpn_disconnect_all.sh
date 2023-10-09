#!/bin/bash

# Notify the user that the VPNs are disconnecting
notify-send "VPN Disconnection" "Disconnecting all VPNs..."

# Get the list of all active VPN sessions
SESSIONS=$(openvpn3 sessions-list | grep "Path:" | awk '{print $2}')

# Check if there are active sessions
if [ -z "$SESSIONS" ]; then
  notify-send "VPN Disconnection" "No active VPN sessions found!"
  exit 0
fi

# Disconnect each session
for SESSION_PATH in $SESSIONS; do
  openvpn3 session-manage --path $SESSION_PATH --disconnect
done

# Notify the user that the VPNs are disconnected
notify-send "VPN Disconnection" "All VPNs disconnected!"
