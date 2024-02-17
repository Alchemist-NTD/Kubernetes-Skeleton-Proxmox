#!/bin/bash

tar -cvf ../kubespray.tar ../kubespray

ansible-playbook -i ./inventory/hosts playbook.yaml
