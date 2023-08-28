#!/usr/bin/env bash

# vagrant by default creates its own keypair for all the machines. Password based authentication will be disabled by default and enabling it so password based auth can be done.

sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Supressing the banner message everytime you connect to the vagrant box.

touch /home/vagrant/.hushlogin

# Updating the hosts file for all the 4 nodes with the IP given in vagrantfile

# 192.168.56.10  manager.ansible.com manager
# 192.168.56.11   controller.k8s.com controller
# 192.168.56.12      worker1.k8s.com worker1
# 192.168.56.13      worker2.k8s.com worker2

echo -e "192.168.56.10 manager.ansible.com manager\n192.168.56.11 controller.k8s.com controller\n192.168.56.12 worker1.k8s.com worker1\n192.168.56.13 worker2.k8s.com worker2" >> /etc/hosts

# Installing necessary packages 

sudo apt-get update
sudo apt-get -y install curl wget net-tools iputils-ping python3-pip sshpass

# Install ansible using pip only in manager node

if [[ $(hostname) = "manager" ]]; then
  sudo pip3 install ansible
fi
