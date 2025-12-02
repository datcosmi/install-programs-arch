#!/bin/sh

# Install the required dependencies
yay -S --noconfirm --needed wireguard-tools
yay -S --noconfirm --needed systemd-resolvconf
yay -S --noconfirm --needed networkmanager
yay -S --noconfirm --needed network-manager-applet

# Install the AUR GUI for ProtonVPN
yay -S --noconfirm --needed proton-vpn-gtk-app
