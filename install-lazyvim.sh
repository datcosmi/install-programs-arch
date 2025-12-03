#!/usr/bin/env bash

backup() {
  if [ -d "$1" ]; then
    if [ -d "$1.bak" ]; then
      echo "Backup for $1 already exists, skipping..."
    else
      mv "$1" "$1.bak"
      echo "Backed up $1 → $1.bak"
    fi
  fi
}

# Required
backup "$HOME/.config/nvim"

# Optional but recommended
backup "$HOME/.local/share/nvim"
backup "$HOME/.local/state/nvim"
backup "$HOME/.cache/nvim"

# Install LazyVim
git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
rm -rf "$HOME/.config/nvim/.git"

echo "LazyVim installed successfully!"
