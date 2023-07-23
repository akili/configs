#!/bin/bash

VAULT_PASS_FILE=vault.txt
VARS_FILE=vars2.yaml

if [ ! -f $VAULT_PASS_FILE ]; then
    echo 'Creating file with ansible-vault password. Write pass:'
    read -sr pass
    echo "$pass" > $VAULT_PASS_FILE
fi;

if [ ! -f $VARS_FILE ]; then
    echo 'Creating file with ansible encrypted vars. Write became pass:'
    read -sr pass
    echo "ansible_become_pass: $pass" > $VARS_FILE
    ansible-vault encrypt $VARS_FILE
fi;

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

ansible-playbook make-common.yaml -i hosts --vault-password-file=$VAULT_PASS_FILE

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

