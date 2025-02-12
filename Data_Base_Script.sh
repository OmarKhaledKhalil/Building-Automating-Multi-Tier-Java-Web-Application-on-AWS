#!/bin/bash
# Amazon Linux User Data - MySQL Setup for db01

echo "Starting MySQL Installation on Amazon Linux..."

# Update and install MySQL
sudo yum update -y
sudo amazon-linux-extras enable mariadb10.5
sudo yum install -y mariadb-server

# Start and enable MySQL
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Secure MySQL Installation (Auto-Answer)
sudo mysql_secure_installation <<EOF

Y
Omar123
Omar123
Y
Y
Y
Y
EOF

# Create Application Database
sudo mysql -u root -pOmar123 <<EOF
CREATE DATABASE accounts;
GRANT ALL PRIVILEGES ON accounts.* TO 'admin'@'%' IDENTIFIED BY 'Omar123';
FLUSH PRIVILEGES;
EOF

echo "MySQL setup completed on Amazon Linux!"


echo "MariaDB provisioning completed successfully!"

