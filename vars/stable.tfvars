# Proxmox #######################
proxmox_hostname                = "proxmox"
proxmox_ssh_key_path            = "~/.ssh/"
proxmox_resource_pool           = "Kubernetes-Stable"


# Talos #########################
talos_image_node_name           = "talos"
talos_virtual_ip                = "10.10.10.50"
talos_disable_flannel           = true


# Kubernetes ####################
kubernetes_cluster_name         = "stable"


# Controlplanes #################
controlplane_vmid_prefix        = "402"               # 4011-4019
controlplane_node_name          = "talos"

controlplane_hostname_prefix    = "k8s-cp"
controlplane_ip_prefix          = "10.10.10.5"      # 11-19
controlplane_mac_address_prefix = "00:00:00:00:00:1"  # 00:11 - 00:19
controlplane_vlan_id            = "40"

controlplane_tags               = [
  "app-kubernetes",
  "clusterid-stable",
  "type-controlplane"
]


# Worker Nodes ##################
workernode_vmid_prefix          = "403"               # 4021-4029
workernode_node_name            = "talos"

workernode_hostname_prefix      = "k8s-node"
workernode_ip_prefix            = "10.10.10.6"      # 21-29
workernode_mac_address_prefix   = "00:00:00:00:00:2"  # 00:21 - 00:29
workernode_vlan_id              = "40"

workernode_tags                 = [
  "app-kubernetes",
  "clusterid-stable",
  "type-workernode"
]
