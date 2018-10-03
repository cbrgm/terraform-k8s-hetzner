# Add public key resource
resource "hcloud_ssh_key" "cluster_admin" {
	name       = "cluster_admin"
	public_key = "${file(var.ssh_public_key)}"
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
	token = "${var.hcloud_token}"
}

# Bootstrap and initialize master
resource "hcloud_server" "master" {
	name = "kubernetes-master"
	image = "${var.node_image}"
	server_type = "${var.master_type}"
	ssh_keys = ["${hcloud_ssh_key.cluster_admin.id}"]

	connection {
		private_key = "${file(var.ssh_private_key)}"
	}

	provisioner "file" {
		source      = "${path.module}/hack/bootstrap.sh"
		destination = "/root/bootstrap.sh"
	}

	provisioner "remote-exec" {
		inline = "/bin/bash /root/bootstrap.sh"
	}

	provisioner "file" {
		source      = "${path.module}/hack/master.sh"
		destination = "/root/master.sh"
	}

	provisioner "remote-exec" {
		inline = "/bin/bash /root/master.sh"
	}

	provisioner "local-exec" {
	command = "bash ${path.module}/hack/copy_local.sh"

		environment {
			SSH_PRIVATE_KEY 	= "${var.ssh_private_key}"
			SSH_CONN   				= "root@${hcloud_server.master.ipv4_address}"
			COPY_TO_LOCAL    	= "creds/"
		}
	}
}
