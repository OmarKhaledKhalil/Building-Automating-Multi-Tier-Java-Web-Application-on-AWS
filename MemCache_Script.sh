#!/bin/bash
# Amazon Linux User Data - Memcached Setup for mc01

echo "Starting Memcached Setup on Amazon Linux..."

# Update System Packages
sudo yum update -y
sudo amazon-linux-extras enable memcached1
sudo yum install -y memcached

# Configure Memcached to accept external connections
sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/sysconfig/memcached

# Start Memcached
sudo systemctl start memcached
sudo systemctl enable memcached

echo "Memcached setup completed!"


echo "Memcached provisioning completed successfully!"

