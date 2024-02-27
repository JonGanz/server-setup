#!/bin/bash

ansible-playbook -i localhost, -c local server-setup.yml
ansible-playbook -i localhost, -c local nfs-mounts.yml

ansible-playbook -i localhost, -c local ./valheim/deploy.yml
ansible-playbook -i localhost, -c local ./tandoor/deploy.yml

