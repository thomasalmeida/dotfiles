#!/bin/bash

# toggle_docker_service.sh
# Script to toggle the Docker service

temp_file=$(mktemp /tmp/docker_service_status.XXXXXX)

# Function to execute Docker service command in terminal, write status to a temp file, and notify
execute_and_notify() {
  local action="$1"
  local success_flag=""
  local command_file=$(mktemp)

  # Prepare the command sequence based on the action
  if [[ "$action" == "start" ]]; then
    echo "sudo systemctl start docker" > "$command_file"
    success_flag="Docker service is now running."
  elif [[ "$action" == "stop" ]]; then
    echo "sudo systemctl stop docker.socket docker containerd" > "$command_file"
    success_flag="Docker service has been stopped."
  fi

  # Execute each command in the command file
  while IFS= read -r cmd; do
    $(head -n 1 ~/dotfiles/.settings/terminal.sh) --title "FloatingTerminal" --command $cmd
  done < "$command_file"

  # Check the exit status of the last command
  if [ $? -eq 0 ]; then
    echo 'success' > "$temp_file"
    notify-send "Docker" "$success_flag"
  else
    notify-send "Docker" "Failed to $action the Docker service."
  fi

  # Clean up
  rm -f "$temp_file"
  rm -f "$command_file"
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
