#!/bin/bash

# Read the default terminal from terminal.sh script
TERMINAL=$(head -n 1 ~/dotfiles/.settings/terminal.sh)

# Execute the default terminal to open Neovim with the .todo file
$TERMINAL -e bash -c "nvim ~/.todo"
