#!/bin/bash

echo "Убедись, что никто не подглядывает и введи пароль: "
# shellcheck disable=SC2162
read pass

echo "$pass" | sudo -S apt update
echo "$pass" | sudo -S apt install -y ansible git

cd ~ || exit

CONFIG_DIR='configs'
[ ! -d "$CONFIG_DIR" ] && git clone https://github.com/akili/configs.git $CONFIG_DIR
cd $CONFIG_DIR && git pull

ansible-playbook make-local.yaml --extra-vars "ansible_sudo_pass=$pass"
