#!/usr/bin/env bash

# Prompt for the locality
read -rp "Work(1) or home(2): " locality

# Update package list and install necessary packages
sudo apt update
sudo apt install -y ansible git python3-pip

# Change to home directory
cd ~ || exit

# Clone or update the configuration repository
CONFIG_DIR="$HOME/configs"
if [ ! -d "$CONFIG_DIR" ]; then
    git clone https://github.com/akili/configs.git "$CONFIG_DIR"
else
    cd "$CONFIG_DIR" || exit
    git pull origin master
fi

# Define paths for Ansible files
VAULT_PASS_FILE=vault.txt
VARS_FILE=vars.yaml

if [ ! -f $VAULT_PASS_FILE ]; then
    read -sr 'Creating file with ansible-vault password. Write pass: ' pass
    echo "$pass" > $VAULT_PASS_FILE
    echo
fi;

if [ ! -f $VARS_FILE ]; then
    read -sr 'Creating file with ansible encrypted vars. Write became pass: ' pass
    echo "ansible_become_pass: $pass" > $VARS_FILE
    ansible-vault encrypt $VARS_FILE
    echo
fi;

# Upgrade Ansible
python3 -m pip install --upgrade --user ansible

# Run Ansible playbooks
ansible-playbook make-common.yaml -i hosts --vault-password-file=$VAULT_PASS_FILE

case "$locality" in
    "1")
        ansible-playbook make-work.yaml -i hosts
        echo "Work apps configurated"
        ;;
    "2")
        ansible-playbook make-home.yaml -i hosts
        echo "Home apps configurated"
        ;;
    *)
        echo "Invalid option. Exiting."
        exit 1
        ;;
esac

# Use stow to manage dotfiles
stow vim
stow nvim
stow tmux

read -rp "Installation and configuration are completed. Reboot the system (y/n)?" answer
if [[ "$answer" == "y" ]]; then
    sudo reboot now
fi
