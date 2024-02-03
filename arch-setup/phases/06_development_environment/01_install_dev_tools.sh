#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Installing development tools
print_msg "blue" "::" "Installing development tools..."
dev_tools=(
  dbeaver
  docker
  docker-compose
  git-cola
  jq
  postman-bin
  vscodium
)
for tool in "${dev_tools[@]}"; do
  check_and_install "$tool"
done
print_msg "green" "->" "Development tools installed."
