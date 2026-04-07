# 🚀 Day 63 – Variables, Outputs, Data Sources & Expressions

## 📌 Overview

On Day 63, I transformed my Terraform configuration from **hardcoded infrastructure** into a **fully dynamic, reusable, and environment-aware setup**.

This marks an important step toward writing **production-ready Terraform code**.

---

## 🎯 Objectives Achieved

- Removed all hardcoded values  
- Introduced input variables  
- Used `.tfvars` files for multiple environments  
- Added outputs for better visibility  
- Implemented data sources for dynamic values  
- Used locals for consistent naming and tagging  
- Practiced Terraform functions and expressions  

---

## 🧩 1. Variables

I created input variables to make the configuration reusable and flexible.

### Variables Used:
- region  
- vpc_cidr  
- subnet_cidr  
- instance_type  
- project_name (required input)  
- environment  
- allowed_ports  
- extra_tags  

---

## 📂 2. Variable Files

### Dev Environment
- project_name = terraweek  
- environment = dev  
- instance_type = t2.micro  

### Production Environment
- project_name = terraweek  
- environment = prod  
- instance_type = t3.small  
- vpc_cidr = 10.1.0.0/16  
- subnet_cidr = 10.1.1.0/24  

---

## ⚙️ 3. Variable Precedence (Low → High)

1. Default values  
2. terraform.tfvars  
3. *.auto.tfvars  
4. -var-file  
5. -var (CLI flag)  
6. TF_VAR_* environment variables  

---

## 📤 4. Outputs

I configured outputs to retrieve important infrastructure details after deployment:

- VPC ID  
- Subnet ID  
- Instance ID  
- Instance Public IP  
- Instance Public DNS  
- Security Group ID  

These can be accessed using:
- terraform output  
- terraform output <name>  
- terraform output -json  

---

## 🔍 5. Data Sources

Instead of hardcoding values, I used data sources to dynamically fetch:

- Latest Amazon Linux AMI  
- Available Availability Zones  

This ensures the configuration works across regions without modification.

---

## 🧠 6. Locals

Locals were used to create reusable values:

- name_prefix → combines project name and environment  
- common_tags → standard tags applied across all resources  

This helps maintain consistency and reduces repetition.

---

## 🏷️ Tagging Strategy

All resources follow a consistent tagging approach:

- Project  
- Environment  
- ManagedBy  
- Name (dynamic based on resource type)  

This improves:
- Resource organization  
- Cost tracking  
- Maintainability  

---

## 🔧 7. Useful Terraform Functions

Some functions I practiced:

- upper → converts string to uppercase  
- join → combines list elements into a string  
- length → counts elements in a list  
- lookup → retrieves value from a map  
- cidrsubnet → generates subnet CIDR blocks  

---

## ⚖️ 8. Resource vs Data Source

- Resource → creates infrastructure  
- Data Source → fetches existing information  

---

## 🔄 9. Variable vs Local vs Output vs Data

- Variable → user input  
- Local → reusable internal values  
- Output → display values after deployment  
- Data → fetch existing AWS resources  

---

## 🧪 10. Conditional Expression

Used conditional logic to dynamically adjust instance type based on environment:

- dev → smaller instance  
- prod → larger instance  

---

## 🚀 Key Learnings

- Avoid hardcoding in Terraform  
- Use variables for flexibility  
- Use locals for consistency  
- Use data sources for dynamic configuration  
- Use outputs for visibility  
- Use functions for powerful expressions  

---

## 📢 Learn in Public

Made my Terraform configs fully dynamic today — variables for every environment, data sources for AMI lookups, locals for consistent tagging, and conditional expressions for environment-specific sizing.

Zero hardcoded values.

#90DaysOfDevOps #TerraWeek #DevOpsKaJosh #TrainWithShubham

---

## 🙌 Conclusion

Day 63 helped me move from basic Terraform usage to real-world infrastructure practices.

Now my configurations are:

- Reusable  
- Scalable  
- Environment-aware  
- Production-ready  

---
