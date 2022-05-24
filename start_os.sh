#!/usr/bin/env bash

echo "Введите пароль: "
read -r pass

echo "$pass" | sudo -S apt update && apt install -y python3-pip

python3 -m pip install --user ansible

ansible-playbook make-local.yaml --extra-vars "ansible_sudo_pass=$pass"
