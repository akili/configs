#!/bin/bash

echo "Введите пароль: "
# shellcheck disable=SC2162
read pass

echo "$pass" | sudo -S apt update
echo "$pass" | sudo -S apt install -y ansible

ansible-playbook make-local.yaml --extra-vars "ansible_sudo_pass=$pass"
