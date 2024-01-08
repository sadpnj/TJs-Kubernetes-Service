resource "proxmox_virtual_environment_container" "caddy" {
  description = "Internal proxy"

  node_name = var.node_name

  initialization {
    hostname = "caddy"
    dns {
        servers = ["1.1.1.1","8.8.8.8"]
    }
    ip_config {
      ipv4 {
        address = var.caddy_ip_lan
        gateway = var.gateway
      }
    }
    ip_config {
      ipv4 {
        address = var.caddy_ip_internal
        gateway = var.cluster_gateway
      }
    }

    user_account {
      keys = [
        trimspace(tls_private_key.ubuntu_container_key.public_key_openssh)
      ]
      password = random_password.ubuntu_container_password.result
    }
  }

  network_interface {
    name = "veth0"
    bridge = "vmbr0"
  }
  network_interface {
    name = "veth1"
    bridge = "vmbr1"
  }

  operating_system {
    template_file_id = proxmox_virtual_environment_download_file.latest_ubuntu_22_jammy_lxc_img.id
    type             = "ubuntu"
  }

  disk {
    datastore_id = "local-lvm"
    size = 10
  }

  memory {
    dedicated = "1024"
    swap = "1024"
  }

  cpu {
    cores = "2"
  }
}

resource "proxmox_virtual_environment_download_file" "latest_ubuntu_22_jammy_lxc_img" {
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = "proxmox"
  url          = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.tar.gz"
}

resource "random_password" "ubuntu_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "tls_private_key" "ubuntu_container_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

output "ubuntu_container_password" {
  value     = random_password.ubuntu_container_password.result
  sensitive = true
}

output "ubuntu_container_private_key" {
  value     = tls_private_key.ubuntu_container_key.private_key_pem
  sensitive = true
}

output "ubuntu_container_public_key" {
  value = tls_private_key.ubuntu_container_key.public_key_openssh
}