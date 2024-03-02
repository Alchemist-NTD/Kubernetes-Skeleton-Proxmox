#!/bin/bash

tar -cvf ./configurations-management/roles/kubernetes-cluster/files/kubespray.tar ./kubespray

tar -cvf ./roles/ansible-server/files/configurations-management.tar ./configurations-management

rm -rf ~/.ssh/known_hosts

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ./inventory/hosts.yaml -e "ansible_port=8888" remote-playbook.yaml

# ansible-playbook -i ./inventory/hosts node-exporter.yaml

# ansible-playbook -i ./inventory/hosts media-server-playbook.yaml
