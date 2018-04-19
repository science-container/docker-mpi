#/bin/bash
echo "Deleting exisiting dependencies"
sudo yum -y remove docker \
    docker-latest-logrotate \
    docker-logrotate \
    docker-selinux \
    docker-engine-selinux \
    docker-engine

echo "Installing basic utilities"
sudo yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2

echo "Setting up repo"
sudo yum-config-manager \
    -y --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

echo "Enabling docker-ce-edge"
sudo yum-config-manager --enable docker-ce-edge -y 

echo "Installing docker-ce"
sudo yum install docker-ce-17.09.1.ce -y 

echo "Starting docker"

sudo systemctl start docker & 

echo "Adding docker to group"
sudo groupadd docker

echo "Setting docker username and password"
sudo gpasswd -a $USER docker & 

newgrp docker  

sudo service docker restart
echo "Running hello world example"
docker run hello-world & 
