# Day 62 -- Providers, Resources and Dependencies
## Task 1: AWS Provider Setup

[file](./terraform-aws-infra/provider.tf)

### Notes
`~> 5.0` → Allows versions like 5.x but not 6.x

`>= 5.0` → Allows any version above 5.0

`= 5.0.0` → Strict version only

### .terraform.lock.hcl

**Version:** The specific version of the provider currently in use.

**Constraints:** The version range you defined in your .tf files (e.g., ~> 5.0).

**Hashes:** A list of checksums. Terraform uses these to verify that the provider binary downloaded on a CI/CD server is identical to the one you used locally.

---

## Task 2: Build a VPC from Scratch & Task 3: Implicit Dependencies
[main.tf](./terraform-aws-infra/main.tf)

aws_vpc.main
   ↓
   ├── aws_subnet.main
   ├── aws_internet_gateway.gw
   └── aws_route_table.route_table
           ↓
           aws_route_table_association.route_table_association



**Examples:**

Subnet → depends on VPC

Internet Gateway → depends on VPC

Route Table → depends on VPC

Route → depends on IGW

Association → depends on subnet + route table

**How Terraform knows order?**

Terraform builds a dependency graph using references like:

aws_vpc.main.id

---
## Task 4: Add a Security Group and EC2 Instance

### Implicit Dependencies
Terraform detects implicit dependencies via references like vpc_id = aws_vpc.main.id (subnet 

depends on VPC) or subnet_id = aws_subnet.public.id (association depends on subnet). It creates 

VPC before subnet; attempting subnet first fails with "VPC not found" error

## Task 5: Explicit Dependencies with depends_on
### Explicit Dependencies and Graph
S3 bucket uses depends_on = [aws_instance.main] despite no reference, forcing creation after 

EC2—for example, when bucket policy needs instance role or logging starts post-launch. Real uses: 

Lambda + CloudWatch trigger; module outputs not directly referenceable


## Lifecycle Rules and Destroy
Changing AMI triggers replace; create_before_destroy = true plans new instance first, minimizing 

downtime. prevent_destroy = true blocks accidental destroy for critical resources like prod DBs. 

ignore_changes = [tags] skips external tag updates (e.g., cost allocation tools) from triggering plans.

terraform destroy removes in reverse order (S3, EC2, subnet→VPC last), cleaning AWS console—no charges.