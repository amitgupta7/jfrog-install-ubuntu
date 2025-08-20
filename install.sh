#! /bin/bash
set -e
export JFROG_HOME=/data/jfrog
echo "deb https://releases.jfrog.io/artifactory/artifactory-debs $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list
wget -qO - https://releases.jfrog.io/artifactory/api/gpg/key/public | sudo apt-key add - 
sudo apt-get install -y net-tools
sudo apt-get update && sudo apt-get install -y jfrog-artifactory-oss 
sudo systemctl restart artifactory.service
