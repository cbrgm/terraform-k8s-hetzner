variable "ssh_public_key" {
  description = "SSH public key to be copied on machines"
  default = "~/.ssh/hetzner.pub"
}

variable "ssh_private_key" {
  description = "SSH private key to be used to log into machines"
  default = "~/.ssh/hetzner"
}

variable "node_image" {
  default = "ubuntu-18.04"
}

variable "master_type" {
  default = "cx21"
}

variable "worker_type" {
  default = "cx11"
}

variable "hcloud_token" {}
variable "workers" {}
