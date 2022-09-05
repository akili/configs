#!/bin/bash

echo -n "Root password: "
# shellcheck disable=SC2162
read -s pass

echo "$pass" | sudo -S apt update
echo "$pass" | sudo -S apt install -y ansible git python3-pip

cd ~ || exit

CONFIG_DIR='configs'
[ ! -d "$CONFIG_DIR" ] && git clone https://github.com/akili/configs.git $CONFIG_DIR
cd $CONFIG_DIR && git pull origin master

python3 -m pip install --upgrade --user ansible
ansible-playbook make-local.yaml --extra-vars "ansible_sudo_pass=$pass"

stow vim
stow nvim
stow tmux

