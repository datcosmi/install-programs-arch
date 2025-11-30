#!/bin/sh

# Required packages
sudo pacman -S base-devel linux-headers git nano --needed

# Install the drivers
yay -S --noconfirm --aneeded nvidia-open nvidia-utils lib32-nvidia-utils

yay -S --noconfirm --needed nvidia-settings
