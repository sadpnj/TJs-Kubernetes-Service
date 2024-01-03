# Proxmox #######################
proxmox_hostname                = "192.168.1.113"
proxmox_ssh_key_path            = "~/.ssh/id_rsa"
proxmox_resource_pool           = "Kubernetes-Talos"


# Talos #########################
talos_image_node_name           = "proxmox"
talos_virtual_ip                = "10.10.10.50"
talos_disable_flannel           = true


# Kubernetes ####################
kubernetes_cluster_name         = "talos"


# Controlplanes #################
controlplane_vmid_prefix        = "405"               # 4051-4059
controlplane_node_name          = "proxmox"
controlplane_num                = 1

controlplane_hostname_prefix    = "k8s-cp"
controlplane_ip_prefix          = "10.10.10.5"      # 51-59
controlplane_mac_address_prefix = "00:00:00:00:00:5"  # 00:51 - 00:59

controlplane_cpu_cores          = "2"
controlplane_memory             = "2048"
controlplane_disk_size          = "10"

controlplane_network_device = "vmbr1"

controlplane_tags               = [
  "app-kubernetes",
  "clusterid-test",
  "type-controlplane"
]


# Worker Nodes ##################
workernode_vmid_prefix          = "406"               # 4061-4069
workernode_node_name            = "proxmox"
workernode_num                  = 1

workernode_hostname_prefix      = "k8s-node"
workernode_ip_prefix            = "10.10.10.6"      # 62-69
workernode_mac_address_prefix   = "00:00:00:00:00:6"  # 00:61 - 00:69

workernode_cpu_cores            = "2"
workernode_memory               = "2048"
workernode_disk_size            = "10"

workernode_network_device = "vmbr1"

workernode_tags                 = [
  "app-kubernetes",
  "clusterid-test",
  "type-workernode"
]
