#!/usr/bin/env bash

# Install nerd font (needed)
yay -S --noconfirm --needed ttf-hack-nerd

# Install and setup starship
curl -sS https://starship.rs/install.sh | sh

CONFIG_FILE="$HOME/.config/fish/config.fish"
LINE='starship init fish | source'

# Create file if it does not exist
mkdir -p "$(dirname "$CONFIG_FILE")"
touch "$CONFIG_FILE"

# Check if the line is already present
if ! grep -Fxq "$LINE" "$CONFIG_FILE"; then
  echo "$LINE" >>"$CONFIG_FILE"
  echo "Added starship initialization to config.fish"
else
  echo "Line already exists in config.fish. Nothing to do."
fi
