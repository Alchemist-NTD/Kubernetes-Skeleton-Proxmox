#!/bin/bash
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ./inventory/lite-hosts.yaml playbook.yaml