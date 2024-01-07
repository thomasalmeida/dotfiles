#!/bin/bash

# Ask the user if they have an NVIDIA GPU
read -p "Do you have an NVIDIA GPU? (yes/no): " has_nvidia

if [[ "$has_nvidia" == "yes" ]]; then
  # Install NVIDIA packages
  print_msg "blue" "::" "Installing NVIDIA packages..."
  yay -S --noconfirm linux-headers nvidia-dkms qt5-wayland qt5ct libva libva-nvidia-driver-git
  print_msg "green" "->" "NVIDIA packages installed."

  # Configure mkinitcpio
  print_msg "blue" "::" "Configuring mkinitcpio for NVIDIA..."
  sudo sed -i 's/^MODULES=(/&nvidia nvidia_modeset nvidia_uvm nvidia_drm /' /etc/mkinitcpio.conf
  sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img
  print_msg "green" "->" "mkinitcpio configured and initramfs image generated."

  # Create NVIDIA Configuration
  print_msg "blue" "::" "Creating NVIDIA configuration..."
  echo "options nvidia-drm modeset=1" | sudo tee /etc/modprobe.d/nvidia.conf
  print_msg "green" "->" "NVIDIA configuration set."

  # Verify NVIDIA Configuration
  print_msg "blue" "::" "Verifying NVIDIA configuration..."
  if grep -q "options nvidia-drm modeset=1" /etc/modprobe.d/nvidia.conf; then
    print_msg "green" "->" "NVIDIA configuration verified."
  else
    print_msg "red" "!!" "NVIDIA configuration verification failed."
    exit 1
  fi

  print_msg "green" "->" "NVIDIA GPU setup completed."
else
  print_msg "blue" "::" "NVIDIA GPU setup skipped."
fi
