#!/usr/bin/env bash
set -e

#############################################
#                 COLORS                    #
#############################################

RED="\033[1;31m"
GRN="\033[1;32m"
YLW="\033[1;33m"
BLU="\033[1;34m"
CYN="\033[1;36m"
RST="\033[0m"

#############################################
#             UTILITY FUNCTIONS             #
#############################################

spinner() {
  local pid=$!
  local delay=0.1
  local spin='|/-\'
  while kill -0 "$pid" 2>/dev/null; do
    for i in $(seq 0 3); do
      printf "\r${CYN}${spin:$i:1}${RST} "
      sleep $delay
    done
  done
  printf "\r   \r"
}

log() {
  printf "${BLU}==>${RST} $1\n"
}

success() {
  printf "${GRN}✔${RST} $1\n"
}

error() {
  printf "${RED}✖${RST} $1\n"
  exit 1
}

#############################################
#       ENSURE SCRIPT RUNS IN ITS FOLDER    #
#############################################

cd "$(dirname "$0")"

#############################################
#        CHECK SCRIPT PERMISSIONS           #
#############################################

for file in install-*.sh set-shell.sh; do
  if [ -f "$file" ] && [ ! -x "$file" ]; then
    chmod +x "$file"
  fi
done

#############################################
#              CHECK FOR YAY                #
#############################################

log "Checking if 'yay' is installed..."

if ! command -v yay >/dev/null 2>&1; then
  printf "${YLW}Yay is not installed.${RST}\n"
  printf "Would you like to auto-install it? [Y/n] "
  read -r yn

  if [ "$yn" != "n" ] && [ "$yn" != "N" ]; then
    log "Installing yay (AUR helper)..."

    (
      sudo pacman -S --needed --noconfirm base-devel git >/dev/null 2>&1
      git clone https://aur.archlinux.org/yay.git >/dev/null 2>&1
      cd yay
      makepkg -si --noconfirm >/dev/null 2>&1
    ) &
    spinner

    rm -rf yay
    success "yay successfully installed!"
  else
    error "Install aborted. 'yay' is required for this script."
  fi
else
  success "yay is already installed."
fi

#############################################
#          RUN INSTALL SCRIPTS              #
#############################################

run_script() {
  local script="$1"
  if [ -f "$script" ]; then
    log "Running $script..."
    ("./$script" >/dev/null 2>&1) &
    spinner
    success "$script completed."
  else
    error "$script not found!"
  fi
}

log "Starting full installation..."

run_script install-stow.sh
run_script install-node.sh
run_script install-zen.sh
run_script install-fish.sh
run_script install-proton.sh
run_script install-flatpak.sh
run_script install-ghostty.sh
run_script install-nvim.sh
run_script install-alacritty.sh
run_script install-nautilus.sh
run_script install-localsend.sh
run_script install-pulsemeeter.sh
run_script install-easyeffects.sh
run_script install-nvidia.sh
run_script install-git.sh
run_script install-discord.sh
run_script install-yazi.sh
run_script install-steam.sh
run_script install-docker.sh
# run_script install-hyprland.sh

run_script install-dotfiles.sh
run_script set-shell.sh

#############################################
#                FINISHED                   #
#############################################

printf "\n${GRN}============================================================${RST}\n"
printf "${GRN}      Full installation completed successfully!${RST}\n"
printf "${GRN}============================================================${RST}\n\n"
printf "Log out and back in to apply your new default shell and settings.\n"
