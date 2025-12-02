#!/bin/bash

# Check if fish is installed
if ! command -v fish &>/dev/null; then
  echo "Fish is not installed. Please install it first."
  exit 1
fi

# Get the path to fish
FISH_PATH=$(which fish)

# Check if fish is already the default shell
if [ "$SHELL" = "$FISH_PATH" ]; then
  echo "Fish is already your default shell."
  exit 0
fi

# Add fish to /etc/shells if not already there
if ! grep -q "^$FISH_PATH$" /etc/shells; then
  echo "$FISH_PATH" | sudo tee -a /etc/shells >/dev/null
fi

# Change the default shell to fish
chsh -s "$FISH_PATH"

echo "Default shell changed to fish. Please log out and log back in to apply the change."
