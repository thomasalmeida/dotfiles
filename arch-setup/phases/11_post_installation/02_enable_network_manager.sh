#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Enabling and starting the NetworkManager service for network management
print_msg "blue" "::" "Enabling and starting NetworkManager service..."
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service
print_msg "green" "->" "NetworkManager service enabled and started."
