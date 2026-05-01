# Day 68 -- Introduction to Ansible and Inventory Setup
## Task 1: Understand Ansible

## Configuration Management
Configuration Management helps maintain servers in a consistent state using automation.

**Why needed?**
- Reduces manual work  
- Avoids errors  
- Ensures consistency  
- Faster deployment  

---

## Ansible vs Chef, Puppet, Salt

- **Ansible** → Agentless, YAML, Push-based  
- **Chef** → Agent-based, Ruby  
- **Puppet** → Agent-based, Puppet DSL  
- **Salt** → Agent optional, Python/YAML  

**Ansible is easier because it uses simple YAML syntax.**

---

## What is Agentless?
Agentless means no software needs to be installed on target servers.

Ansible connects using:
- SSH → Linux  
- WinRM → Windows  

---

## Ansible Architecture

### Control Node
Machine where Ansible runs.

### Managed Nodes
Servers managed by Ansible.

### Inventory
List of target servers.

### Modules
Small tasks like installing packages or copying files.

### Playbooks
YAML files that automate tasks.

--- 

## 🏗️ Lab Setup (Using Terraform)

I used Terraform modules to provision infrastructure:

- 2 EC2 instances (Ubuntu 22.04)  
- Instance type: `t2.micro`  
- Security group allowing SSH (port 22)  
- Key pair for secure login  

👉 Instances:
- `worker-node-1` → Web server  
- `worker-node-2` → App server  

---

## 🔧 Ansible Installation

Installed Ansible on control node:

```bash
sudo apt update
sudo apt install ansible -y
```

---

### inventory file- **hosts.ini**

[file-hosts.ini](./hosts.ini)

### ansible config **ansible.cfg**

[file-ansible.cfg](./ansible.cfg)

Svreenshot

---

### Ad-Hoc Commands
1. Check uptime

`ansible all -m command -a "uptime"`

2. Check memory

`ansible web -m command -a "free -h"`

3. Check disk usage

`ansible all -m command -a "df -h"`

4. Copy file

`echo "Hello from Ansible" > hello.txt`
`ansible all -m copy -a "src=hello.txt dest=/tmp/hello.txt"`

5. Verify file

`ansible all -m command -a "cat /tmp/hello.txt"`

--- 
### What is --become?
**--become** is used to execute tasks as root (sudo privileges).

👉 Required when:

- Installing packages
- Managing services
- Changing system configurations

