#!/bin/bash

#root check
if (( EUID != 0 )); then
        echo "This script must be run as root."
        echo "Please run using as a super user eg(sudo su or sudo -i)"
        exit 1
fi
packages=("nginx" "curl" "wget")

echo "**** Updating packages list ****"
# -qq = very quietly, -q = quiet or --quiet , --quiet --quiet . 
apt-get update -qq


for package in "${packages[@]}";
do
        echo "***** Checking $package ***** "
        if dpkg -s "$package" &> /dev/null; then
                version=$(dpkg -s "$package" | awk '/^Version:/ {print $2}')
                echo "$package is already Installed Version: $version"

        else
                echo "***** $package not found. Installing ***** "

                if apt-get install -y "$package" &> /dev/null; then
                        echo "Successfully installed $package"
                else
                        echo "Failed to Install $package"
                fi
        fi
done