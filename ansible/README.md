### I - DEPLOY ANSIBLE USING VAGRANT ON VIRTUALBOX
![ansible-image](https://user-images.githubusercontent.com/54384725/210966670-0b02268e-c99d-42f5-ba41-2d7c7fe6fe99.png)


#### Ansible Lab Using Vagrant And Virtualbox

#### This repository contains three node ansible lab setup using vagrant and virtualbox as the provider.

| Node Type | Vagrant VM Define |  IP Address   | OS Flavor      | App               |
| ----------| ------------------|---------------|----------------|-------------------|
| VM1       | manager           | 192.168.56.10 | ubuntu/focal64 | Ansible-Manager   |
| VM2       | controller        | 192.168.56.11 | ubuntu/focal64 | K8S-Controller    |
| VM3       | worker1           | 192.168.56.12 | ubuntu/focal64 | K8S-Worker Node 1 |
| VM4       | worker2           | 192.168.56.13 | ubuntu/focal64 | K8S-Worker Node 2 |

```
git clone https://github.com/truongcaoxuan/ansible-lab.git
cd ansible-lab
vagrant up
vagrant status
vagrant global-status --prune
```
## II - DEPLOY K8S CLUSTER USING ANSIBLE PLAYBOOK
```
vagrant ssh manager
bash key_gen.sh
ansible -i ~/ansible/inventory all -m ping
```

### 1. Creating a Kubernetes user with Ansible Playbook
```
ansible-playbook -i ~/ansible/inventory ~/k8s/users.yml
```

### 2. Install Kubernetes with Ansible Playbook
```
ansible-playbook -i ~/ansible/inventory ~/k8s/install-k8s.yml
```

### 3. Creating a Kubernetes Cluster Controller Node using Ansible Playbook
```
ansible-playbook -i ~/ansible/inventory ~/k8s/controllers.yml
kubectl get nodes
```

### 4. Join Worker Nodes to Kubernetes Cluster using Ansible Playbook
```
ansible-playbook -i ~/ansible/inventory ~/k8s/join-workers.yml
kubectl get nodes
```
### CLEAN LAB
#### Destroy all vm
```
vagrant destroy -f
```

### Reference link.
- https://ostechnix.com/ansible-lab-setup-with-vagrant-and-virtualbox-in-linux/
- https://github.com/KarthickSudhakar/Ansible_lab_vagrant_virtualbox
- https://buildvirtual.net/deploy-a-kubernetes-cluster-using-ansible/
