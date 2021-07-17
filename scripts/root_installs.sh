#!/bin/bash
apt update -y && apt full-upgrade -y
apt autoremove -y && apt clean -y && apt autoclean -y
apt install -y gnupg
apt install -y sysstat
apt install -y glances
apt install -y msr-tools
apt install -y ifstat
apt install -y slurm
apt install -y bmon
apt install -y iftop
apt install -y nethogs
apt install -y speedometer
apt install -y vnstat
apt install -y nload
apt install -y wavemon
apt install -y cockpit
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
apt update -y
apt install -y mongodb-org
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
sudo systemctl start mongod
sudo systemctl daemon-reload
sudo systemctl status mongod
sudo systemctl enable mongod