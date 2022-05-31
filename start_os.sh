#!/bin/bash

echo "Введите пароль: "
# shellcheck disable=SC2162
read pass

echo "$pass" | sudo -S apt update
echo "$pass" | sudo -S apt install -y ansible

mkdir akili
cd akili || exit

git clone https://github.com/akili/configs.git
cd configs || exit

ansible-playbook make-local.yaml --extra-vars "ansible_sudo_pass=$pass"
