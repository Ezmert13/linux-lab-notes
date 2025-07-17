#!/bin/bash

# Creates a user for running the application with minimal permissions.

USERNAME="devopsapp"
GROUP="devops"

sudo groupadd $GROUP

sudo useradd -m -s /bin/bash -g $GROUP $USERNAME

echo "$USERNAME:very_strong_password123" | sudo chpasswd

sudo mkdir -p /opt/devopsapp
sudo chown $USERNAME:$GROUP /opt/devopsapp
sudo chmod 750 /opt/devopsapp

echo "User $USERNAME created and configured"
