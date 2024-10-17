#!/usr/bin/env bash

set -eo pipefail

BOLD_RED='\033[1;31m'
RED='\033[0;31m'

# Prompt for the locality
locality="h"
read -p "Work or home [w/H]: " -r answer
locality=${answer:-$locality}

# Prompt for the system host
desktop="n"
read -p "Is it a desktop? [y/N]: " -r answer
desktop=${answer:-$desktop}

# Update package list and install necessary packages
sudo apt update
sudo apt install -y ansible git python3-pip

# Change to home directory
cd ~ || exit

# Clone or update the configuration repository
CONFIG_DIR="$HOME/configs"
if [ ! -d "$CONFIG_DIR" ]; then
    git clone https://github.com/akili/configs.git "$CONFIG_DIR"
fi
cd "$CONFIG_DIR" || exit
git pull origin master

# Define paths for Ansible files
VAULT_PASS_FILE=vault.txt
VARS_FILE=vars.yaml

 if [ ! -f $VAULT_PASS_FILE ]; then
    read -p 'Creating file with ansible-vault password. Write pass: ' -sr pass
    echo "$pass" > $VAULT_PASS_FILE
    echo
fi;

if [ ! -f $VARS_FILE ]; then
    read -p 'Creating file with ansible encrypted vars. Write became pass: ' -sr pass
    echo "ansible_become_pass: $pass" > $VARS_FILE
    echo
    ansible-vault encrypt $VARS_FILE
fi;

# Upgrade Ansible
python3 -m pip install --upgrade --user ansible

# Run Ansible playbooks
ansible-playbook make-common.yaml -i hosts --vault-password-file=$VAULT_PASS_FILE --user "$USER"

case "$locality" in
    "w")
        ansible-playbook make-work.yaml -i hosts --user "$USER"
        echo "Work apps configurated"
        ;;
    "h")
        ansible-playbook make-home.yaml -i hosts --user "$USER"
        echo "Home apps configurated"
        ;;
    *)
        echo -e "${BOLD_RED}ERROR!${RED} Invalid option. Locality wasn't configured."
        ;;
esac

if [[ "$desktop" == "y" ]]; then
        ansible-playbook install-desktop-apps.yaml -i hosts --vault-password-file=$VAULT_PASS_FILE --user "$USER"
fi;

# Use stow to manage dotfiles
stow vim
stow nvim
stow tmux

default_answer="y"
read -p "Installation and configuration are completed. Reboot the system (Y/n)? " -r answer
answer=${answer:-$default_answer}
if [[ "$answer" == "y" ]]; then
    sudo reboot now
fi
