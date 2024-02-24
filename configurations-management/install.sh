#!/bin/bash

tar -cvf ../kubespray.tar ../kubespray

ansible-playbook -i ./inventory/hosts playbook.yaml

ansible-playbook -i ./inventory/hosts node-exporter.yaml

ansible-playbook -i ./inventory/hosts media-server-playbook.yaml
