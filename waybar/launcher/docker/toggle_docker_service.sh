#!/bin/bash

# toggle_docker_service.sh
# Script to toggle the Docker service using Kitty and a temporary file for communication

temp_file=$(mktemp /tmp/docker_service_status.XXXXXX)

# Function to execute Docker service command in Kitty, write status to a temp file, and notify
execute_and_notify() {
  local action="$1"
  local command=""
  local success_flag=""

  if [[ "$action" == "start" ]]; then
    command="sudo systemctl start docker && echo 'success' > \"$temp_file\""
    success_flag="Docker service is now running."
  elif [[ "$action" == "stop" ]]; then
    command="sudo systemctl stop docker.socket && sudo systemctl stop docker && sudo systemctl stop containerd && echo 'success' > \"$temp_file\""
    success_flag="Docker service has been stopped."
  fi

  kitty --title "FloatingKitty" -- bash -c "$command echo 'Press Enter to exit'; read"

  # Check the operation result and notify
  if [[ -f "$temp_file" && $(cat "$temp_file") == 'success' ]]; then
    notify-send "Docker" "$success_flag"
  else
    notify-send "Docker" "Failed to $action the Docker service."
  fi

  rm -f "$temp_file"
}

# Function to toggle Docker service
toggle_docker_service() {
  if systemctl is-active --quiet docker; then
    execute_and_notify "stop"
  else
    execute_and_notify "start"
  fi
}

toggle_docker_service
