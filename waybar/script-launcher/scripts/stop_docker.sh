#!/bin/bash

# stop_docker.sh
# Script to stop all Docker instances and free up resources

# Notify the user that Docker instances are stopping
notify-send "Docker" "Stopping all Docker instances..."

# Stop all running Docker containers
docker stop $(docker ps -aq)

# Optionally: Free up space by removing unused data
# docker system prune -a -f

# Notify the user that Docker instances have stopped
notify-send "Docker" "All Docker instances have been stopped."
