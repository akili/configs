#!/bin/bash

echo "Work(1) or home(2)?"
# shellcheck disable=SC2162
read locality

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

ansible-playbook make-common.yaml -i hosts --extra-vars "ansible_sudo_pass=$pass"


if [[ "$locality" == "1" ]]; then
    ansible-playbook make-work.yaml -i hosts --extra-vars "ansible_sudo_pass=$pass"
    echo "Work apps configurated"
fi
if [[ "$locality" == "2" ]]; then
    ansible-playbook make-home.yaml -i hosts --extra-vars "ansible_sudo_pass=$pass"
    echo "Home apps configurated"
fi

stow vim
stow nvim
stow tmux

