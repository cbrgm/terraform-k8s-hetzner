#!/bin/bash
set -eu

sleep 30

apt-get -qq update && apt-get -qq upgrade -y
apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

# Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
  stable"

apt-get -qq update && apt-get -qq install -y docker-ce

# Disable swap
swapoff -a

# Install kubelet, kubeadm, kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get -qq update && apt-get -qq install -y kubelet kubeadm

systemctl daemon-reload
systemctl restart kubelet