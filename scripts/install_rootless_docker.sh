#!/bin/bash

# Run the Installation Script
curl -fsSL https://get.docker.com/rootless | sh

# Configure Shell Environment
# Append to .bashrc
echo "export PATH=$HOME/bin:$PATH" >> ~/.bashrc
echo "export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock" >> ~/.bashrc

# Apply changes to current session
source ~/.bashrc

# Verification Steps
# Expected - /home/reporter/bin/docker
which docker

# Expected - Rootless: true
docker info | grep Rootless
