#!/bin/bash
set -eu

# Run the join command and enable docker, kubelet
eval "$(cat /tmp/cluster_join)"
systemctl enable docker kubelet
