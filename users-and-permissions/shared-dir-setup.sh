#!/bin/bash

# Creates a shared directory for the devops group.

SHARE_DIR="/opt/devops-shared"
GROUP="devops"

sudo mkdir -p $SHARE_DIR
sudo chown root:$GROUP $SHARE_DIR
sudo chmod 2770 $SHARE_DIR

echo "Shared directory $SHARE_DIR configured with SGID bit for group $GROUP"
