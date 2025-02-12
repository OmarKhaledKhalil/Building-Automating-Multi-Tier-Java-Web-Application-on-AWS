#!/bin/bash
# Amazon Linux User Data - Tomcat & Java Setup for app01

echo "Starting Tomcat & Java Setup on Amazon Linux..."

# Update and install Java
sudo yum update -y
sudo amazon-linux-extras enable corretto8
sudo yum install -y java-11-amazon-corretto-devel git maven wget

# Install Tomcat
cd /tmp
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz
tar xzvf apache-tomcat-9.0.75.tar.gz
sudo mkdir -p /usr/local/tomcat
sudo mv apache-tomcat-9.0.75/* /usr/local/tomcat/

# Create Tomcat user
sudo useradd -r -d /usr/local/tomcat -s /sbin/nologin tomcat
sudo chown -R tomcat:tomcat /usr/local/tomcat

# Configure Tomcat systemd service
sudo tee /etc/systemd/system/tomcat.service > /dev/null <<EOF
[Unit]
Description=Tomcat
After=network.target

[Service]
User=tomcat
WorkingDirectory=/usr/local/tomcat
Environment=JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto
ExecStart=/usr/local/tomcat/bin/catalina.sh run
ExecStop=/usr/local/tomcat/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOF

# Start Tomcat
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl enable tomcat

echo "Tomcat setup completed!"

