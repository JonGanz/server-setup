#!/bin/bash

# Clone the repository
git clone https://github.com/JonGanz/server-setup.git
cd server-setup

# Install Ansible.
apt update
apt install -y software-properties-common
add-apt-repository --yes --update ppa:ansible/ansible
apt install -y ansible

# Do the install/updates.
. update.sh

