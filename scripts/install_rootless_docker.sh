#!/bin/bash

# Run the Installation Script
curl -fsSL https://get.docker.com/rootless | sh

# Configure Shell Environment
# Append to .bashrc
echo "export PATH=$HOME/bin:$PATH" >> ~/.bashrc
echo "export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock" >> ~/.bashrc

# Apply changes to current session
source ~/.bashrc

# Create the CLI plugins directory
mkdir -p ~/.docker/cli-plugins/

# Download the latest Docker Compose binary (Linux x86_64)
curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose

# Make the binary executable
chmod +x ~/.docker/cli-plugins/docker-compose

# Verify the installation
docker compose version

# Verification Steps
# Expected - /home/reporter/bin/docker
which docker

# Expected - Rootless: true
docker info | grep Rootless
