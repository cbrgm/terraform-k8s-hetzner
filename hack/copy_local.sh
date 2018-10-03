#!/bin/bash
set -eu

# Set values from env vars
SSH_PRIVATE_KEY=${SSH_PRIVATE_KEY:-}
SSH_CONN=${SSH_CONN:-}
COPY_TO_LOCAL=${COPY_TO_LOCAL:-}

# Create directory (+parents if not exists)
mkdir -p "${COPY_TO_LOCAL}"

# Copy join command string written to file before from kubeadm output
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
    -i "${SSH_PRIVATE_KEY}" \
    "${SSH_CONN}:/tmp/cluster_join" \
    "${COPY_TO_LOCAL}"

# Copy admin config
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
    -i "${SSH_PRIVATE_KEY}" \
    "${SSH_CONN}:/etc/kubernetes/admin.conf" \
    "${COPY_TO_LOCAL}"
