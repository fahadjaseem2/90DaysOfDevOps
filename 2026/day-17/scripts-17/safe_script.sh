#!/bin/bash

# Exit immediately if a command exits with non-zero status
set -e

echo "Creating directory..."
mkdir /tmp/devops-test || { echo "Directory already exists"; exit 1; }
# The { ...; } is a command group. It lets you run multiple commands after ||.

echo "Entering directory..."
cd /tmp/devops-test || { echo "Failed to enter directory"; exit 1; }

echo "Creating file..."
touch testfile.txt || echo "Failed to create file"

echo "Script executed successfully"
