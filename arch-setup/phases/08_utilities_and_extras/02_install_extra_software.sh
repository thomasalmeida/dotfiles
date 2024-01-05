#!/bin/bash

# Installing extra software
print_msg "blue" "::" "Installing extra software..."
extra_software=(zoom virt-manager)
for software in "${extra_software[@]}"; do
  check_and_install "$software"
done
print_msg "green" "->" "Extra software installed."
