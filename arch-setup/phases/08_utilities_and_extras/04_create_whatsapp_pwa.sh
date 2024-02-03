#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Create WhatsApp Web App with Nativefier
print_msg "blue" "::" "Creating WhatsApp Web App..."
nativefier --name "WhatsApp" "https://web.whatsapp.com" --tray --out $HOME/Applications
print_msg "green" "->" "WhatsApp Web App created."
