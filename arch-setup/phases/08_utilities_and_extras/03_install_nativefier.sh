#!/bin/bash

# Install Nativefier
print_msg "blue" "::" "Installing Nativefier..."
check_and_install "npm"
npm install -g nativefier
print_msg "green" "->" "Nativefier installed."
