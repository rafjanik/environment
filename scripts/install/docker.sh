#!/bin/bash

if [[ $EUID -ne 0 ]]
then
   echo -e "Brak uprawnień, użyj polecenia $0"
   exit 1
fi

apt update

apt install -y ca-certificates curl gnupg lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update

apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-buildx-plugin

groupadd docker
usermod -aG docker $USER
newgrp docker

# fix problem: "ERROR: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock ..."
sudo chown $USER /var/run/docker.sock

docker run hello-world
docker --version
docker compose version