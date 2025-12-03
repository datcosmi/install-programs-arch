#!/usr/bin/env bash

yay -S rose-pine-hyprcursor

CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"
LINE='env = HYPRCURSOR_THEME,rose-pine-hyprcursor'

# Ensure the directory exists
mkdir -p "$(dirname "$CONFIG_FILE")"

# Ensure the file exists
touch "$CONFIG_FILE"

# Add the line only if it is not already present
if ! grep -Fxq "$LINE" "$CONFIG_FILE"; then
  echo "$LINE" >>"$CONFIG_FILE"
  echo "Added HYPRCURSOR_THEME to hyprland.conf"
else
  echo "Line already exists in hyprland.conf, nothing to do."
fi
