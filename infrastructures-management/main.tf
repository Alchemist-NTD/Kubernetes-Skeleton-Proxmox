module "kubernetes-master-nodes" {
    source = "./module/kubernetes"

    node_count    = 3
    node_type     = "master"
    node_desc     = "k8s ubuntu server master nodes"
    node_memory   = 4096
    node_ip_base  = "192.168.1.11"
    node_disk_size = "32G"
    template_name = var.template_name
    vm_password   = var.vm_password
    ssh_key       = var.ssh_key
}

module "kubernetes-worker-nodes" {
    source = "./module/kubernetes"

    node_count    = 3
    node_type     = "worker"
    node_desc     = "k8s ubuntu server worker nodes"
    node_memory   = 4096
    node_ip_base  = "192.168.1.12"
    node_disk_size = "32G"
    template_name = var.template_name
    vm_password   = var.vm_password
    ssh_key       = var.ssh_key
}

module "kubernetes-load-balancer" {
    source = "./module/kubernetes"

    node_count    = 1
    node_type     = "load-balancer"
    node_desc     = "k8s ubuntu server load balancer"
    node_memory   = 2048
    node_ip_base  = "192.168.1.13"
    node_disk_size = "16G"
    template_name = var.template_name
    vm_password   = var.vm_password
    ssh_key       = var.ssh_key
}

module "kubespray-server" {
    source = "./module/kubernetes"

    node_count    = 1
    node_type     = "kubespray-server"
    node_desc     = "kubespray server"
    node_memory   = 2048
    node_ip_base  = "192.168.1.10"
    node_disk_size = "16G"
    template_name = var.template_name
    vm_password   = var.vm_password
    ssh_key       = var.ssh_key
}

module "single-nodes" {
    source = "./module/kubernetes"

    node_count    = 1
    node_type     = "ubuntu-vm"
    node_desc     = "ubuntu server nodes"
    node_memory   = 4096
    node_ip_base  = "192.168.1.9"
    node_disk_size = "32G"
    template_name = var.template_name
    vm_password   = var.vm_password
    ssh_key       = var.ssh_key
}
