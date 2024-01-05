#!/bin/bash

# Configure Docker
print_msg "blue" "::" "Configuring Docker..."

# Add current user to the docker group
sudo usermod -aG docker $USER

print_msg "green" "->" "User added to the docker group. Docker commands can now be run without sudo."
