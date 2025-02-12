#!/bin/bash
# Amazon Linux User Data - RabbitMQ Setup for rmq01

echo "Starting RabbitMQ Setup on Amazon Linux..."

# Update System
sudo yum update -y

# Install Erlang and RabbitMQ
sudo amazon-linux-extras enable erlang
sudo yum install -y erlang rabbitmq-server

# Start and enable RabbitMQ
sudo systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server

# Create RabbitMQ User
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator

echo "RabbitMQ setup completed!"

