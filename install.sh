#! /bin/bash
JFROG_HOME=/data/jfrog
DIST=$(lsb_release -c | grep Codename | awk '{print $2}')
#echo "deb https://releases.jfrog.io/artifactory/artifactory-pro-debs $DIST main" | sudo tee -a /etc/apt/sources.list
#wget -qO - https://releases.jfrog.io/artifactory/api/v2/repositories/artifactory-pro-debs/keyPairs/primary/public | sudo apt-key add -
sudo apt-get install -y net-tools
sudo apt-get update && sudo apt-get install -y jfrog-artifactory-oss 
sudo systemctl restart artifactory.service
