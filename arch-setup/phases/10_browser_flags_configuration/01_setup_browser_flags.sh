#!/bin/bash

# Configuring browser flags
print_msg "blue" "::" "Making the flag modifications persistent for Chromium, Brave, and VSCodium..."
mkdir -p ~/.local/share/applications/

# Chromium
cp /usr/share/applications/chromium.desktop ~/.local/share/applications/
sed -i 's|Exec=/usr/bin/chromium %U|Exec=/usr/bin/chromium --ozone-platform-hint=wayland --force-dark-mode --enable-features=WebUIDarkMode --ignore-gpu-blocklist --enable-gpu-rasterization --enable-zero-copy --gtk-version=4 %U|' ~/.local/share/applications/chromium.desktop

# Brave
cp /usr/share/applications/brave-browser.desktop ~/.local/share/applications/
sed -i 's|Exec=/usr/bin/brave-browser-stable %U|Exec=/usr/bin/brave-browser-stable --ozone-platform-hint=wayland --force-dark-mode --enable-features=WebUIDarkMode --ignore-gpu-blocklist --enable-gpu-rasterization --enable-zero-copy --gtk-version=4 %U|' ~/.local/share/applications/brave-browser.desktop

# VSCodium
cp /usr/share/applications/vscodium.desktop ~/.local/share/applications/
sed -i 's|Exec=/usr/bin/codium --no-sandbox %F|Exec=/usr/bin/codium --no-sandbox --ozone-platform-hint=wayland --force-dark-mode --enable-features=WebUIDarkMode --ignore-gpu-blocklist --enable-gpu-rasterization --enable-zero-copy --gtk-version=4 %F|' ~/.local/share/applications/vscodium.desktop

print_msg "green" "->" "Flags added to Chromium, Brave, and VSCodium launchers."
