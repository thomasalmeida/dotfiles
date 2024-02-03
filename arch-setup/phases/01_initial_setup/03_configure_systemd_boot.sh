#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Configuring systemd-boot
print_msg "blue" "::" "Configuring systemd-boot..."
sudo sed -i 's/timeout .*/timeout 0/' /boot/loader/loader.conf
for entry in /boot/loader/entries/*.conf; do
  sudo sed -i 's/quiet//' "$entry"
done
if [[ $? -ne 0 ]]; then
  print_msg "red" "!!" "An error occurred during the systemd-boot configuration. Exiting..."
  exit 1
fi
print_msg "green" "->" "systemd-boot configured successfully."
