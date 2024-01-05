#!/bin/bash

# Utility function for colored outputs
print_msg() {
  local color="$1"
  local symbol="$2"
  local msg="$3"
  case $color in
    "red")    echo -e "\033[0;31m${symbol} ${msg}\033[0m";;
    "green")  echo -e "\033[0;32m${symbol} ${msg}\033[0m";;
    "blue")   echo -e "\033[0;34m${symbol} ${msg}\033[0m";;
    *)        echo "${msg}";;
  esac
}

# Function to handle errors
error_check() {
  if [[ $? -ne 0 ]]; then
    print_msg "red" "!!" "An error occurred in $1. Exiting..."
    exit 1
  fi
}

# Check if a package is installed and install it if it's not
check_and_install() {
  local package="$1"
  if ! pacman -Qq "$package" &> /dev/null; then
    print_msg "blue" "::" "Installing $package..."
    sudo pacman -S --noconfirm "$package"
    if [[ $? -ne 0 ]]; then
      print_msg "red" "!!" "Error installing $package."
      exit 1
    fi
    print_msg "green" "->" "$package installed successfully."
  else
    print_msg "blue" "::" "$package is already installed."
  fi
}
