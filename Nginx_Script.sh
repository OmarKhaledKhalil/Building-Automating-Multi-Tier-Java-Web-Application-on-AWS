#!/bin/bash
# Amazon Linux User Data - Nginx Setup for web01

echo "Starting Nginx Setup on Amazon Linux..."

# Update System
sudo yum update -y
sudo amazon-linux-extras enable nginx1
sudo yum install -y nginx

# Configure Nginx as Reverse Proxy
sudo tee /etc/nginx/nginx.conf > /dev/null <<EOF
events {
  worker_connections 1024;
}

http {
  server {
    listen 80;
    location / {
      proxy_pass http://app01:8080;
    }
  }
}
EOF

# Start Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx setup completed!"

