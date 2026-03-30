# Day 61 -- Introduction to Terraform and Your First AWS Infrastructure

## Task 1: Understand Infrastructure as Code
### What is Infrastructure as Code (IaC)? Why does it matter in DevOps?

Infrastructure as Code (IaC) means managing servers, networks, databases, etc. using code instead of clicking in a UI (like AWS console).

**Instead of manually creating resources:**

- You write a config file
- Run it
- Infrastructure gets created automatically

**Why it matters in DevOps:**

- Everything becomes automated
- You can reuse the same setup
- Works well with CI/CD pipelines
- Easy to track changes using Git (version control)


### What problems does IaC solve compared to manually creating resources in the AWS console?

**Manual setup problems:**
- ❌ Human errors (wrong configs, missed steps)
- ❌ No consistency (every environment different)
- ❌ Hard to scale (doing same steps again & again)
- ❌ No version control (who changed what?)
- ❌ Time-consuming

**IaC fixes this:**
- Same code → same environment every time
- One command → full setup
- Changes are tracked in Git
- Easy to replicate (dev → staging → prod)


### How is Terraform different from AWS CloudFormation, Ansible, and Pulumi?
**Terraform**
- Works with multiple cloud providers (AWS, Azure, GCP)
- Uses its own language (HCL)

**AWS CloudFormation**
- Works only with AWS
- Uses JSON/YAML
- Deep AWS integration
**👉 Difference:**
- Terraform = multi-cloud
- CloudFormation = AWS only

**Ansible**
- Mainly used for configuration management
- Example: installing software, setting up servers
**👉 Difference:**
- Terraform → creates infrastructure
- Ansible → configures inside servers


**Pulumi**
- Uses real programming languages (Python, JS, etc.)
- More flexible but slightly complex
**👉 Difference:**
- Terraform → simple declarative configs
- Pulumi → coding-based approach


### What does it mean that Terraform is "declarative" and "cloud-agnostic"?

**Declarative means:**
You tell WHAT you want, not HOW to do it.
**Example:**
You write: “I want 2 EC2 instances”
Terraform figures out how to create them
- You don’t write step-by-step commands.

**What does "Cloud-Agnostic" mean?**

Cloud-agnostic means:
Works across different cloud providers.
With Terraform:
Same tool works for **AWS, Azure, GCP**
You are not locked to one cloud provider.

---

## Task 2: Install Terraform and Configure AWS
### Install Terraform:
```
# macOS
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

**Verify:**
Screenshot

---

## Task 3: Create S3 Bucket
[View s3.tf](./terraweek-file/s3.tf)

### Command used:
```
terraform init
terraform plan
terraform apply
```

---

## Task 4: Add EC2
[View s3.tf](./terraweek-file/s3.tf)

### Command used:
```
terraform plan
terraform apply
```

---

## Task 5: State File

Terraform creates:
`terraform.tfstate`

It stores:
- resource IDs
- configuration
- current state

How Terraform knows what's created?

`From terraform.tfstate`

Why not edit state file?

`It can break your infrastructure`

Why not commit it to Git?

`Contains sensitive info (IDs, configs)`

---

## Task 6: Modify & Destroy

Symbols:

`+` → create

`~` → modify

`-` → delete

Destroy Everything

`terraform destroy`

### 🔥 Pro Tip (Important)
Add .gitignore:
```
.terraform/
*.tfstate
*.tfstate.backup
```


