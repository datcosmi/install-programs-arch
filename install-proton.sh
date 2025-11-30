#!/bin/sh

# Install the required dependencies
sudo pacman -S --noconfirm --needed wireguard-tools
sudo pacman -S --noconfirm --needed systemd-resolvconf
sudo pacman -S --noconfirm --needed networkmanager
sudo pacman -S --noconfirm --needed network-manager-applet

# Install the AUR GUI for ProtonVPN
sudo pacman -S --noconfirm --needed proton-vpn-gtk-app
