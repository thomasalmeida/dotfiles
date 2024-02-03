#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Installing and configuring Git
print_msg "blue" "::" "Installing and configuring Git..."

# Install Git if it's not already installed
check_and_install "git"

# Configure Git name if not already set
if [[ -z $(git config --global user.name) ]]; then
  read -p "Please enter your Git name: " git_name
  git config --global user.name "$git_name"
  if [[ $? -ne 0 ]]; then
    print_msg "red" "!!" "An error occurred while setting Git name. Exiting..."
    exit 1
  fi
fi

# Configure Git email if not already set
if [[ -z $(git config --global user.email) ]]; then
  read -p "Please enter your Git email: " git_email
  git config --global user.email "$git_email"
  if [[ $? -ne 0 ]]; then
    print_msg "red" "!!" "An error occurred while setting Git email. Exiting..."
    exit 1
  fi
fi

print_msg "green" "->" "Git has been installed and configured."
