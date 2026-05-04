# 📘 Day 70 — Variables, Facts, Conditionals & Loops

## 🎯 Objective
Today’s goal was to make Ansible playbooks dynamic instead of static.  
Instead of running the same tasks on every server, I learned how to adapt behavior based on host, environment, and conditions.

---

# 📂 What I Did

## 🔹 1. Worked with Variables
I started by defining variables inside playbooks such as application name, port, and directory paths.  
Then I tested overriding these variables from the command line.

### 💡 Learning:
- Variables make playbooks reusable and flexible  
- CLI variables override playbook variables  
- Hardcoding values is not a good practice in real environments  

---

## 🔹 2. Used group_vars and host_vars
I moved variables out of playbooks into structured files:
- group_vars → for group-level configuration  
- host_vars → for specific host overrides  

I observed how different hosts picked different values automatically.

### 💡 Learning:
- group_vars applies to a group of servers  
- host_vars overrides group-level values  
- Helps in managing environments like web, db, prod, dev  

---

## 🧠 Variable Precedence (Key Concept)

I learned how Ansible decides which variable to use when multiple values exist.

Priority (low → high):
- group variables  
- host variables  
- playbook variables  
- command line variables  

### 💡 Learning:
- Host-specific configs override group configs  
- CLI variables override everything  
- Understanding precedence is critical to avoid confusion  

---

## 🔹 3. Explored Ansible Facts
I used Ansible facts to gather system information like:
- OS type  
- IP address  
- Memory  

I also ran commands to filter specific facts.

### 💡 Learning:
- Facts make playbooks intelligent and environment-aware  
- No need to manually define system information  
- Useful for OS-based automation and monitoring  

---

## 🔹 4. Implemented Conditionals
I used conditions to control when tasks should run:
- Only run tasks for web servers  
- Only run tasks for specific OS (Ubuntu)  
- Run tasks based on memory availability  

### 💡 Learning:
- Not all tasks should run on every host  
- Conditions help target the right systems  
- Makes automation efficient and safe  

---

## 🔹 5. Implemented Loops
I used loops to:
- Create multiple users  
- Create multiple directories  
- Install multiple packages  

Instead of repeating tasks, I used loops to simplify the playbook.

### 💡 Learning:
- Loops reduce repetition  
- Cleaner and scalable playbooks  
- Modern `loop` is better than older syntax  

---

## 🔹 6. Built Server Health Report (Real-world Task)
I created a playbook that:
- Checked disk usage  
- Checked memory  
- Listed running services  
- Generated a structured report  
- Saved the report as a file on each server  

### 💡 Learning:
- How to combine facts, variables, and commands  
- How to use registered outputs  
- How to generate reports automatically  
- Real-world monitoring basics  

---

# 🚨 Issues I Faced & Fixes

### ❌ wheel group error
- Issue: Group didn’t exist on Ubuntu  
- Fix: Used `sudo` group instead  

### ❌ Same IP for multiple nodes
- Issue: Both inventory hosts pointed to the same instance  
- Fix: Updated inventory with correct private IPs  

### ❌ File not found confusion
- Issue: Checked wrong machine for generated file  
- Fix: Understood that Ansible runs on remote hosts  

### ❌ Facts deprecation warning
- Issue: Old fact variables were used  
- Fix: Switched to structured fact access  

---

# 🧠 Key Takeaways

- Variables make playbooks flexible  
- Facts make playbooks intelligent  
- Conditionals control execution  
- Loops reduce duplication  
- Inventory accuracy is critical  

---

# 🚀 DevOps Insight

Same playbook can behave differently on different servers.  

This is the foundation of real-world configuration management.

---

# 📢 LinkedIn Post

Made Ansible playbooks smart today 🚀  

Learned:
- group_vars & host_vars for dynamic configs  
- facts for system-aware automation  
- conditionals for targeted execution  
- loops for bulk operations  

Also built a server health reporting system using Ansible 💻  

#90DaysOfDevOps #DevOpsKaJosh #TrainWithShubham