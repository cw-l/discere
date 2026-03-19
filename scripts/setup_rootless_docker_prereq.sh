#!/bin/bash

# Install System Dependencies
sudo apt-get update
sudo apt-get install -y uidmap dbus-user-session slirp4netns

# Configure Sub-UID and Sub-GID Ranges
#   [optional] replace user "reporter"
sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 reporter

# Enable Kernel Modules
# Load immediately
sudo modprobe nf_tables

# Make persistent across reboots
echo "nf_tables" | sudo tee -a /etc/modules

# Configure AppArmor Profile
cat <<EOT | sudo tee "/etc/apparmor.d/home.reporter.bin.rootlesskit"
abi <abi/4.0>,
include <tunables/global>

/home/reporter/bin/rootlesskit flags=(unconfined) {
  userns,
  include if exists <local/home.reporter.bin.rootlesskit>
}
EOT

sudo systemctl restart apparmor.service

# Enable User Lingering
sudo loginctl enable-linger reporter
