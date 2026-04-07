############################
# 🌍 Region
############################

# region
variable "region" {
  description = "prefreed region"
  default     = "us-west-2"
  type        = string
}

############################################
# 🌐 Networking Configuration
############################################

# vpc_cidr
variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type    = string
}

# subnet_cidr
variable "subnet_cidr" {
  default = "10.0.0.0/24"
  type    = string
}

############################################
# 🖥️ EC2 Configuration
############################################

# instance_type 
variable "instance_type" {
  description = "this variable holds EC2 instance type"
  default     = "t3.micro"
  type        = string
}

############################################
# 🏷️ Project & Environment
############################################

# project_name
variable "project_name" {
  description = "Name of the Project"
  type        = string
  # NO Default Value , User must Enter the Name
}

# environment
variable "environment" {
  default = "dev"
  type    = string
}

############################################
# 🔐 Security Configuration
############################################

# allowed_ports 
variable "allowed_ports" {
  default = ["22", "80", "443"]
  type    = list(string)
}

############################################
# 🏷️ Additional Tags
############################################

# extra_tags
variable "extra_tags" {
  description = "Additional tags to apply to all resources"
  default     = {}
  type        = map
}