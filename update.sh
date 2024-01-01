#!/bin/bash

ansible-playbook -i localhost, -c local server-setup.yml
ansible-playbook -i localhost, -c local nfs-mounts.yml

