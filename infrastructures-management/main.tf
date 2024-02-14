# kubernetes master nodes
resource "proxmox_vm_qemu" "kubernetes-master-nodes" {
    count = 3
    name = "master-node-${count.index + 1}"
    desc = "k8s ubuntu server master nodes"
    scsihw  = "virtio-scsi-pci"
    os_type = "cloud-init"

    target_node = "proxmox"

    clone = var.template_name
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 4096

    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    ci_wait = 40
    ipconfig0 = "ip=192.168.1.11${count.index + 1}/24,gw=192.168.1.1"
    ciuser = "ubuntu"
    cipassword = var.vm_password
    ssh_user = "ubuntu"
    sshkeys =  <<EOF
        ${var.ssh_key}
    EOF

    disk {
        slot = 0
        storage = "pve-2"
        type = "virtio"
        size = "32G"
        iothread = 1
    }

    connection {
        type     = "ssh"
        agent    = false
        user     = "ubuntu"
        password = var.vm_password
        host     = self.default_ipv4_address
    }

    lifecycle {
        ignore_changes = [
            network,
        ]
    }
}

# kubernetes worker nodes
resource "proxmox_vm_qemu" "kubernetes-worker-nodes" {
    count = 3
    name = "worker-node-${count.index + 1}"
    desc = "k8s ubuntu server worker nodes"
    scsihw  = "virtio-scsi-pci"
    os_type = "cloud-init"

    target_node = "proxmox"

    clone = var.template_name
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 4096

    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    ci_wait = 40
    ipconfig0 = "ip=192.168.1.12${count.index + 1}/24,gw=192.168.1.1"
    ciuser = "ubuntu"
    cipassword = var.vm_password
    ssh_user = "ubuntu"
    sshkeys =  <<EOF
        ${var.ssh_key}
    EOF

    disk {
        slot = 0
        storage = "pve-2"
        type = "virtio"
        size = "32G"
        iothread = 1
    }

    connection {
        type     = "ssh"
        agent    = false
        user     = "ubuntu"
        password = var.vm_password
        host     = self.default_ipv4_address
    }

    lifecycle {
        ignore_changes = [
            network,
        ]
    }
}

# kubernetes cluster load balancer
resource "proxmox_vm_qemu" "kubernetes-load-balancer" {
    count = 1
    name = "kubernetes-lb-${count.index + 1}"
    desc = "k8s ubuntu server load balancer"
    scsihw  = "virtio-scsi-pci"
    os_type = "cloud-init"

    target_node = "proxmox"

    clone = var.template_name
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 2048

    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    ci_wait = 40
    ipconfig0 = "ip=192.168.1.13${count.index + 1}/24,gw=192.168.1.1"
    ciuser = "ubuntu"
    cipassword = var.vm_password
    ssh_user = "ubuntu"
    sshkeys =  <<EOF
        ${var.ssh_key}
    EOF

    disk {
        slot = 0
        storage = "pve-2"
        type = "virtio"
        size = "32G"
        iothread = 1
    }

    connection {
        type     = "ssh"
        agent    = false
        user     = "ubuntu"
        password = var.vm_password
        host     = self.default_ipv4_address
    }

    lifecycle {
        ignore_changes = [
            network,
        ]
    }
}

