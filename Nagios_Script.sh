#!/bin/bash
# Amazon Linux User Data - Nagios Setup for ng01

echo "Starting Nagios Setup on Amazon Linux..."

# Update System
sudo yum update -y

# Install Nagios and Plugins
sudo amazon-linux-extras enable epel
sudo yum install -y nagios nagios-plugins-all nrpe

# Start and enable Nagios
sudo systemctl start nagios
sudo systemctl enable nagios

echo "Nagios setup completed!"

