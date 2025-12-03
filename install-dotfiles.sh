#!/bin/bash

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/datcosmi/mydotfiles.git"
REPO_NAME="mydotfiles"

is_stow_installed() {
  pacman -Qi "stow" &>/dev/null
}

if ! is_stow_installed; then
  echo "Install stow first"
  exit 1
fi

cd ~

# Check if the repository already exists
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
  git clone "$REPO_URL"
fi

# Check if the clone was successful
if [ $? -eq 0 ]; then
  echo "removing old configs"
  rm -rf ~/.config/nvim ~/.config/starship.toml ~/.local/share/nvim/ ~/.cache/nvim/ ~/.config/ghostty/config ~/.config/kitty ~/.config/alacritty ~/.config/swayosd ~/.config/elephant ~/.config/walker ~/.config/waybar ~/.config/hypr ~/.config/omarchy ~/.tmux.conf ~/.config/fish

  cd "$REPO_NAME"
  # stow zshrc
  stow ghostty
  stow tmux
  stow nvim
  stow starship
  stow kitty
  stow alacritty
  stow swayosd
  stow elephant
  stow walker
  stow waybar
  stow hypr
  stow omarchy
  stow fish
else
  echo "Failed to clone the repository."
  exit 1
fi
