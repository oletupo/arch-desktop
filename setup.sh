#!/bin/bash

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" >&2
  exit 1
fi

# Define file paths
PACKAGE_FILE="packages.txt"
SERVICE_FILE="services.txt"

# Check if packages.txt exists
if [[ ! -f $PACKAGE_FILE ]]; then
  echo "Error: $PACKAGE_FILE not found!" >&2
  exit 1
fi

# Check if services.txt exists
if [[ ! -f $SERVICE_FILE ]]; then
  echo "Error: $SERVICE_FILE not found!" >&2
  exit 1
fi

# Install packages from packages.txt
echo "Installing packages..."
while IFS= read -r package; do
  # Skip blank lines and lines starting with #
  [[ -z "$package" || "$package" =~ ^# ]] && continue
  echo "Installing $package..."
  pacman -S --noconfirm --needed "$package"
done < "$PACKAGE_FILE"

# Enable services from services.txt
echo "Enabling services..."
while IFS= read -r service; do
  # Skip blank lines and lines starting with #
  [[ -z "$service" || "$service" =~ ^# ]] && continue
  echo "Enabling $service..."
  systemctl enable "$service"
  # systemctl start "$service"
done < "$SERVICE_FILE"

echo "Setup complete!"