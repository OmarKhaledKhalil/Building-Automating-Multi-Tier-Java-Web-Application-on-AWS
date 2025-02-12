# Building-Automating-Multi-Tier-Java-Web-Application-on-AWS
Building &amp; Automating Multi-Tier Java Web Application on AWS EC2 Using Amazon Linux

📌 Project Overview
This project focuses on deploying and automating a Multi-Tier Java Web Application using AWS EC2 instances based on Amazon Linux. The application follows a multi-tier architecture, ensuring scalability, modularity, and high availability.

Each tier (web, application, database, caching, message queue, and monitoring) is hosted on a separate EC2 instance, with automated provisioning via user data scripts.

🎯 Project Goals
✅ Deploy a Multi-Tier Java Web Application on AWS.
✅ Automate infrastructure setup using EC2 User Data scripts.
✅ Configure Nginx as a reverse proxy for the application.
✅ Deploy Tomcat as an application server to run Java WAR files.
✅ Set up MySQL as a relational database for the application.
✅ Implement Memcached for caching and RabbitMQ for message queueing.
✅ Use Nagios for monitoring system health & application performance.

⚙️ Architecture Overview
This project consists of multiple AWS EC2 instances, each handling a specific role:

Machine	Role	IP Address	Software/Tools
db01	Database Server	Dynamic	MySQL
mc01	Caching Layer	Dynamic	Memcached
rmq01	Message Queueing	Dynamic	RabbitMQ
app01	Application Server	Dynamic	Apache Tomcat, Java, Spring Boot
web01	Web Server (Reverse Proxy)	Dynamic	Nginx
ng01	Monitoring Server	Dynamic	Nagios
🛠 Technologies Used
☁ Cloud Provider: AWS EC2
🔧 Automation: Shell Scripting, AWS User Data
📦 Virtualization: EC2 Instances
🖥 Operating System: Amazon Linux
🌐 Web Server: Nginx
🚀 Application Server: Apache Tomcat
💾 Database: MySQL
⚡ Caching: Memcached
📩 Message Queueing: RabbitMQ
📊 Monitoring: Nagios
🚀 Project Setup
1️⃣ Launch AWS EC2 Instances
Create six (6) EC2 instances for the respective services.
Use Amazon Linux 2 as the base AMI.
Attach a security group that allows necessary ports (80, 8080, 3306, 11211, 5666, etc.).
Assign each instance a static private IP.
2️⃣ Install Required Tools
Ensure your local system has the required dependencies:


sudo yum update -y
sudo yum install -y git
3️⃣ Clone the Repository

git clone https://github.com/OmarKhaledKhalil/Building-Automating-Multi-Tier-Java-Web-Application-on-AWS.git
cd Building-Automating-Multi-Tier-Java-Web-Application-on-AWS
4️⃣ Deploy the Infrastructure
Upload and use the following User Data scripts when launching EC2 instances:

Script	Purpose
Data_Base_Script.sh	Installs & configures MySQL on db01.
MemCache_Script.sh	Sets up Memcached on mc01.
RABBITMQ_Script.sh	Installs RabbitMQ on rmq01.
Tomcat_Script.sh	Configures Apache Tomcat & deploys Java WAR on app01.
Nginx_Script.sh	Configures Nginx as a reverse proxy on web01.
Nagios_Script.sh	Installs and configures Nagios on ng01.
Each script should be added as User Data while launching the respective EC2 instance.

🔍 Accessing the Application
📌 Web Application (Nginx Reverse Proxy)
Open a browser and navigate to:
👉 http://<web01-public-ip>
📌 Tomcat Application Server
Access Tomcat directly:
👉 http://<app01-public-ip>:8080
📌 Nagios Monitoring Dashboard
Check system health:
👉 http://<ng01-public-ip>/nagios
makefile
Username: nagiosadmin
Password: nagios
🔧 Managing the Environment
Start a Specific Machine
aws ec2 start-instances --instance-ids <instance-id>
Stop a Machine
aws ec2 stop-instances --instance-ids <instance-id>
Terminate All Machines
aws ec2 terminate-instances --instance-ids <instance-id-1> <instance-id-2> ...
🛠 Troubleshooting
Check Running Services
✅ For MySQL on db01:

sudo systemctl status mysqld
✅ For Nginx on web01:

bash
Copy
Edit
sudo systemctl status nginx
✅ For Nagios Logs:

sudo tail -f /usr/local/nagios/var/nagios.log
🔮 Future Improvements
🚀 Automate provisioning with Terraform & Ansible
🚀 Deploy application using Docker & Kubernetes
🚀 Integrate CI/CD pipeline for automated deployments
🚀 Use AWS ELB for high availability

👥 Contributing
Contributions are welcome! To contribute:

Fork this repository.
Create a feature branch (git checkout -b feature-branch).
Commit changes (git commit -m "Added new feature").
Push to GitHub (git push origin feature-branch).
Open a Pull Request.
👤 Author
Omar Khaled Khalil
📧 Email: omar.khaled.ahmed.khalil@gmail.com
🔗 LinkedIn: linkedin.com/in/omar-khaled-70a3191a2
