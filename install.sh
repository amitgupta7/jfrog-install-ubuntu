#! /bin/bash
JFROG_HOME=/opt/jfrog
DIST=$(lsb_release -c | grep Codename | awk '{print $2}')
echo "deb https://releases.jfrog.io/artifactory/artifactory-pro-debs $DIST main" | sudo tee -a /etc/apt/sources.list
wget -qO - https://releases.jfrog.io/artifactory/api/v2/repositories/artifactory-pro-debs/keyPairs/primary/public | sudo apt-key add -
sudo apt-get install -y net-tools
sudo apt-get update && sudo apt-get install jfrog-artifactory-pro=7.111.11
mkdir -p /data/artifactory/var
mv /opt/jfrog/artifactory/var /opt/jfrog/artifactory/var.bak
sudo ln -s /data/artifactory/var /opt/jfrog/artifactory/var
sudo chown -h artifactory:artifactory /data/artifactory/var
sudo chown -h artifactory:artifactory /opt/jfrog/artifactory/var
sudo systemctl start artifactory.service
