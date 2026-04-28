# Day 65 - Terraform Modules: Build Reusable Infrastructure

## Overview

Today I learned how Terraform Modules help organize infrastructure code into reusable components.

Until now, everything was written inside a single `main.tf` file, which becomes difficult to manage in real-world environments.

Modules solve this problem by allowing us to:

- Reuse infrastructure code
- Avoid duplication
- Maintain cleaner architecture
- Scale infrastructure across multiple environments

Think of Terraform modules like functions in programming:

**Write once → Reuse many times**

---

# Task 1: Module Structure

Created the following Terraform project structure:

```bash
terraform-modules/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
│
└── modules/
    ├── ec2-instance/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    └── security-group/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf

```
---


## Task 2: Custom EC2 Module
### modules/ec2-instance/variables.tf
[variables.tf](./terraform-modules/modules/ec2-instance/variables.tf)

### modules/ec2-instance/main.tf
[file-main.tf](../day-65/terraform-modules/modules/ec2-instance/main.tf)

### modules/ec2-instance/outputs.tf
[file-outputs.tf](./terraform-modules/modules/ec2-instance/outputs.tf)

---

## Task 3: Custom Security Group Module
### modules/security-group/variables.tf
[file-variables.tf](./terraform-modules/modules/security-group/variables.tf)

### modules/security-group/main.tf
[file-main.tf](./terraform-modules/modules/security-group/main.tf)

### modules/security-group/outputs.tf
[file-outputs.tf](./terraform-modules/modules/security-group/outputs.tf)

---

## Task 4: Calling Modules from Root
### main.tf
[file-main.tf](./terraform-modules/main.tf)

### Root Outputs
```
output "web_server_ip" {
  value = module.web_server.public_ip
}

output "api_server_ip" {
  value = module.api_server.public_ip
}
```

---

## Task 5: Using Terraform Registry Module

nstead of manually writing VPC resources, I used the official Terraform AWS VPC module.





