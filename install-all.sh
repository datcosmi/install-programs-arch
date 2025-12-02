#!/bin/sh

# Check if yay is installed
if ! command -v yay >/dev/null 2>&1; then
  echo "'yay' is not installed."
  echo "Please install it with:"
  echo "   sudo pacman -S --needed base-devel git && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
  exit 1
fi

# Install all packages and programs
. ./install-stow.sh
. ./install-node.sh
. ./install-zen.sh
. ./install-fish.sh
. ./install-yazi.sh
. ./install-proton.sh
. ./install-flatpak.sh
. ./install-ghostty.sh
. ./install-nvim.sh
. ./install-docker.sh
. ./install-alacritty.sh
. ./install-nautilus.sh
. ./install-localsend.sh
. ./install-pulsemeeter.sh
. ./install-easyeffects.sh
. ./install-nvidia.sh
. ./install-git.sh
. ./install-discord.sh
. ./install-steam.sh
# . ./install-hyprland.sh

# Import dotfiles
. ./install-dotfiles.sh

# Set fish as the default shell
. ./set-shell.sh
