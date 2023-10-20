#!/bin/bash

# Source the common functions
source ~/dotfiles/waybar/launcher/common/functions.sh

# toggle_docker_service.sh
# Script to toggle the Docker service

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
  send_notification "Docker Error" "Please run the script with root privileges using pkexec or another method."
  exit 1
fi

# Check if the docker service is active
if systemctl is-active --quiet docker; then
  # If active, then stop it
  systemctl stop docker
  systemctl stop containerd
  send_notification "Docker" "Docker service has been stopped."
else
  # Otherwise, start it
  systemctl start docker
  systemctl start containerd
  send_notification "Docker" "Docker service has been started."
fi
