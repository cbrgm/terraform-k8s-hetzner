#!/bin/bash
set -eu

apt-get install -qq -y kubectl

# Initialize the master
kubeadm init
systemctl enable docker kubelet

# Store join command in temporary file
kubeadm token create --print-join-command > /tmp/cluster_join

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Install weave as cni addon
sysctl net.bridge.bridge-nf-call-iptables=1
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
