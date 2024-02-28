#!/bin/bash

# tar -cvf ../kubespray.tar ../kubespray

rm -rf ~/.ssh/known_hosts

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ./inventory/lite-hosts.yaml playbook.yaml

# ansible-playbook -i ./inventory/hosts node-exporter.yaml

# ansible-playbook -i ./inventory/hosts media-server-playbook.yaml
