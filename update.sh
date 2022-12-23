#!/bin/bash

# Update the package list
echo "Checking for updates, please wait ..."
opkg update

# Get a list of all installed packages
installed_packages=$(opkg list-upgradable | awk '{print $1}')

# Iterate over the list of installed packages and force a reinstall
for package in $installed_packages; do
  echo "Upgrading current package $package"              
  opkg upgrade $package
  echo "Finished upgrading current $package"
done
