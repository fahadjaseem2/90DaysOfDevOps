<img width="570" height="256" alt="Screenshot 2026-04-09 at 3 08 18 PM" src="https://github.com/user-attachments/assets/5a8548af-0dab-4d01-b200-648e1fe59c37" />
# 📦 Terraform State Deep Dive (Day Learning Notes)

## ✅ 1. How many resources does Terraform track?

From the `terraform state list`, Terraform is currently tracking:

👉 **16 resources**

<img width="570" height="256" alt="Screenshot 2026-04-09 at 3 08 18 PM" src="https://github.com/user-attachments/assets/2dd9a576-610f-43de-b67b-dc121f70c21c" />


---

## ✅ 2. What attributes does Terraform state store for an EC2 instance?

Terraform state stores **much more than what is defined in `.tf` files**.  
It captures the **actual live infrastructure state**.

### 🔹 Basic Attributes

- `id` (Instance ID)
- `arn`
- `ami`
- `instance_type`

### 🔹 Networking

- `public_ip`
- `private_ip`
- `subnet_id`
- `vpc_security_group_ids`
- `primary_network_interface_id`

### 🔹 DNS

- `private_dns`
- `public_dns`

### 🔹 Instance State

- `instance_state` (e.g., running, stopped)

### 🔹 Storage (Block Devices)

- `root_block_device`
  - `volume_id`
  - `volume_size`
  - `volume_type`
  - `iops`
  - `throughput`

### 🔹 CPU & Performance

- `cpu_core_count`
- `cpu_threads_per_core`
- `credit_specification`

### 🔹 Metadata & Configuration

- `metadata_options`
- `placement_group`
- `tenancy`

### 🔹 Tags

- `tags`
- `tags_all`

### 🔹 Security & Behavior

- `disable_api_termination`
- `instance_initiated_shutdown_behavior`

👉 **Key Insight:**  
Terraform state reflects the **real infrastructure**, not just your code — enabling drift detection and accurate updates.

---

## ✅ 3. What does the `serial` number in terraform.tfstate represent?

The `serial` number is:

👉 **A version counter of the Terraform state file**

### 🔹 Meaning

- It increments **every time the state file is updated**

### 🔹 Why it matters

- Prevents **state conflicts**
- Helps with **state locking**
- Ensures Terraform uses the **latest state**

### 🔹 Example

```json
"serial": 5


## Task 3
##  🔒 Terraform State Locking (Short Notes)

## 🎯 Objective

Test how Terraform prevents concurrent operations using state locking.

---

## 🧪 Steps

* Run `terraform apply` in Terminal 1
* Run `terraform plan` in Terminal 2

---

## ❗ Observation

* Terminal 2 shows **state lock error** with Lock ID

---

## 🧠 Why Locking is Important

* Prevents multiple users from changing infra at same time
* Avoids state corruption
* Ensures consistency

---

## ⚠️ Fix Stale Lock

* Use force unlock with Lock ID

---

## 🚀 Key Point

👉 Only one Terraform operation can run at a time

---

## 📦 Task 4: Import Existing Resource

## 🎯 Objective

Import an existing S3 bucket into Terraform state.

---

## 🛠️ Steps

1. Created S3 bucket manually:

```bash
terraweek-import-test-fahad
```

2. Added Terraform config:

```hcl
resource "aws_s3_bucket" "imported" {
  bucket = "terraweek-import-test-fahad"
}
```

3. Ran:

```bash
terraform init
terraform import aws_s3_bucket.imported terraweek-import-test-fahad
terraform plan
```

4. Verified:

* ✅ No changes in plan
* ✅ `terraform state list` shows `aws_s3_bucket.imported`

---

## ⚡ Difference

* **Import** → Adds existing resource to Terraform state (does not create)
* **Apply** → Creates new resource and manages it

---

## ✅ Conclusion

Successfully imported an existing S3 bucket and managed it using Terraform.

---

# 🛠️ Terraform State Surgery (mv & rm)

## 🎯 Objective

Learn how to safely modify Terraform state without affecting real infrastructure in AWS.

---

## 🔄 Rename Resource in State (`state mv`)

### 🧪 Steps

* Check existing resources in state
* Rename resource in state
* Update `.tf` file with new name
* Run `terraform plan`

### ✅ Result

* Resource name updated in state
* No infrastructure changes
* Terraform shows **no changes**

---

## ❌ Remove Resource from State (`state rm`)

### 🧪 Steps

* Remove resource from state
* Run `terraform plan`

### ✅ Result

* Terraform no longer tracks the resource
* Resource still exists in AWS
* Terraform may try to recreate it if present in `.tf`

---

## Task 5. Re-import Resource (`terraform import`)

### 🧪 Steps

* Import existing resource back into state
* Ensure `.tf` file matches

### ✅ Result

* Resource is tracked again by Terraform
* No changes if configuration matches

---

## 🧠 When to Use in Real Projects

### 🔹 Use `state mv`

* Renaming resources in code
* Refactoring Terraform structure
* Moving resources between modules

👉 Prevents unnecessary destroy & recreate

---

### 🔹 Use `state rm`

* Stop Terraform from managing a resource
* Resource managed manually or by another system
* Avoid accidental deletion

👉 Keeps resource in AWS but removes from Terraform control

---

## 💡 Key Takeaways

* `state mv` → Rename in state (no infra change)
* `state rm` → Remove from state (no deletion)
* `import` → Bring existing resource into state

---

## 🚀 Summary

```text
state mv → rename tracking
state rm → stop tracking
import  → start tracking
```

---

# 📘 Task 6. – Terraform State Drift

## 🚨 What is Drift?
When infra is changed **outside Terraform**, causing mismatch between:
- Terraform state
- Real AWS resources

---

## ⚙️ Steps

### 1. Apply Config
terraform apply

---

### 2. Create Drift (Manual Change)
Go to AWS Console → EC2:
- Change tag:
  Name = ManuallyChanged  
OR
- Add new tag

---

### 3. Detect Drift
terraform plan

👉 Shows diff (drift detected)

---

### 4. Fix Drift (Option A)
terraform apply

✔️ Restores original config

---

### 5. Verify
terraform plan

✔️ No changes → Drift fixed

---

## 🧠 Prevention (Production)

- 🔐 Restrict console access  
- 🚀 Use CI/CD for all changes  
- 📦 Keep Terraform as source of truth  
- 🔍 Run regular `terraform plan`  
- 🪪 Enforce tagging & policies  

---

## ✅ Summary
- Drift = manual changes  
- plan = detect  
- apply = fix  
