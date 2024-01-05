#!/bin/bash

# Setting up ASDF and installing Go, Ruby, and Node
print_msg "blue" "::" "Setting up ASDF and installing Go, Ruby, and Node..."

# Verify if ASDF is not already installed
if ! [ -d "$HOME/.asdf" ]; then
  # Get the latest release from GitHub
  latest_asdf_release=$(curl -s "https://api.github.com/repos/asdf-vm/asdf/releases/latest" | jq -r .tag_name)

  # Clone the latest release
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $latest_asdf_release
  if [[ $? -ne 0 ]]; then
    print_msg "red" "!!" "Failed to clone ASDF repository. Exiting..."
    exit 1
  fi

  # Add to fish configuration
  # echo "source ~/.asdf/asdf.fish" >> ~/.config/fish/config.fish

  # Setup completions using symbolic link as per recommendation
  mkdir -p ~/.config/fish/completions
  ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
else
  print_msg "yellow" "!!" "asdf is already installed via Git."
fi

# Install plugins and languages
if ! asdf plugin-list | grep -q golang; then
  asdf plugin-add golang
  asdf install golang latest
  latest_version=$(asdf list golang | tail -1)
  asdf global golang $latest_version
fi

if ! asdf plugin-list | grep -q ruby; then
  asdf plugin-add ruby
  asdf install ruby latest
  latest_version=$(asdf list ruby | tail -1)
  asdf global ruby $latest_version
fi

if ! asdf plugin-list | grep -q nodejs; then
  asdf plugin-add nodejs
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
  asdf install nodejs latest
  latest_version=$(asdf list nodejs | tail -1)
  asdf global nodejs $latest_version
fi

print_msg "green" "->" "Go, Ruby, and Node installed using ASDF."
