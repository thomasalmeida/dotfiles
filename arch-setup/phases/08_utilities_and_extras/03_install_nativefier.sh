#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Install Nativefier
print_msg "blue" "::" "Installing Nativefier..."
check_and_install "npm"
npm install -g nativefier
print_msg "green" "->" "Nativefier installed."
