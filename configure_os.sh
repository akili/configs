#!/bin/bash

echo -n "Work(1) or home(2): "
# shellcheck disable=SC2162
read locality

sudo apt update
sudo apt install -y ansible git python3-pip

cd ~ || exit

CONFIG_DIR='configs'
[ ! -d "$CONFIG_DIR" ] && git clone https://github.com/akili/configs.git $CONFIG_DIR
cd $CONFIG_DIR && git pull origin master

python3 -m pip install --upgrade --user ansible

ansible-playbook make-common.yaml -i hosts --vault-password-file=vault.txt

if [[ "$locality" == "1" ]]; then
    ansible-playbook make-work.yaml -i hosts
    echo "Work apps configurated"
fi
if [[ "$locality" == "2" ]]; then
    ansible-playbook make-home.yaml -i hosts
    echo "Home apps configurated"
fi

stow vim
stow nvim
stow tmux

