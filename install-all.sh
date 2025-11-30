#!/bin/sh

sudo pacman -Syu

# Install yay for AUR packages
. ./install-yay.sh

# Install all packages and programs
. ./install-stow.sh
. ./install-node.sh
. ./install-zen.sh
. ./install-zsh.sh
. ./install-proton.sh
. ./install-flatpak.sh
. ./install-ghostty.sh
. ./install-nvim.sh
. ./install-alacritty.sh
. ./install-nautilus.sh
. ./install-localsend.sh
. ./install-pulsemeeter.sh
. ./install-easyeffects.sh
. ./install-nvidia.sh
. ./install-hyprland.sh

. ./set-shell.sh
