#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Installing utilities
print_msg "blue" "::" "Installing utilities..."
utilities=(btop lf gvfs)
for utility in "${utilities[@]}"; do
  check_and_install "$utility"
done
print_msg "green" "->" "Utilities installed."
