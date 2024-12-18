#!/bin/bash

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version



________________________________________________________________________________________________________________________________________
#Docker compose for Sonarqube 
#!/bin/bash

# Update packages and install prerequisites
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg -y

# Step 1: Install Java 11 (OpenJDK)
echo "Installing OpenJDK 11..."
sudo apt install openjdk-11-jdk -y

# Verify Java installation
java -version

# Step 2: Install Docker
echo "Installing Docker..."
# Add Docker GPG key and repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y

# Install Docker CE
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Verify Docker installation
docker --version

# Fix permissions for Docker socket (optional)
sudo chmod 666 /var/run/docker.sock

# Step 3: Pull and Run SonarQube Container
echo "Pulling and running SonarQube container..."
docker pull sonarqube
docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube

# Step 4: Verify Installation
echo "Verifying installation..."
# Check Java version
java -version

# Check Docker info
docker info

# Check running containers
docker container ls

# Completion Message
echo "Java 11, Docker, and SonarQube have been installed successfully!"
echo "Access SonarQube at: http://<server-ip>:9000"


#docker stop 
docker stop 2e1286ed8cfd
docker rm 2e1286ed8cfd

docker rmi sonarqube

check images

