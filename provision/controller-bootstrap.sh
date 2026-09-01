#!/usr/bin/env bash
set -euo pipefail
dnf update -y
dnf -y install ansible-core python3-libselinux
mkdir -p /opt/hpc-ansible
cp -a /vagrant/ansible/. /opt/hpc-ansible/
ansible-playbook -i /opt/hpc-ansible/inventory/hosts.ini /opt/hpc-ansible/playbooks/controller.yml