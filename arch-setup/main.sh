#!/bin/bash

# Include common functions globally
source ./common/common_functions.sh

# Function to execute scripts from a specific phase
execute_phase() {
  for script in arch-setup/phases/$1/*.sh; do
    if [ -f "$script" ]; then
      echo "Running $script..."
      bash "$script"
    fi
  done
}

# Dynamically get list of phases
phases=($(ls -d arch-setup/phases/*/ | xargs -n 1 basename))

# Ask the user which phases to execute
read -p "Enter the phases to execute (e.g., '1,2,4' or 'all' for everything): " input_phases

# Function to check if an array contains a value
contains_element () {
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

# Execute selected phases
if [ "$input_phases" == "all" ]; then
  for phase in "${phases[@]}"; do
    execute_phase "$phase"
  done
else
  IFS=',' read -ra ADDR <<< "$input_phases"
  for index in "${ADDR[@]}"; do
    if contains_element "${phases[index-1]}" "${phases[@]}"; then
      execute_phase "${phases[index-1]}"
    else
      echo "Invalid phase: $index"
    fi
  done
fi

print_msg "green" "->" "Configuration of Arch Linux completed."
print_msg "blue" "::" "It's recommended to restart your machine to ensure all changes are applied correctly."
