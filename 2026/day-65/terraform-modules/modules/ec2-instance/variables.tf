#########################################
#            Instance Info              #
#########################################

variable "ami_id" {
  description 		= "value"
  type 		  		= string
}

variable "instance_type" {
	description 	= "EC2 instance Name"
	default 		= "t2.micro"
	type 			= string
}

variable "instance_name" {
	description 	= "EC2 instance Name"
	type 			= string
}


#########################################
#                  VPC                  #
#########################################

variable "subnet_id" {
	type 			= string
}

variable "security_group_ids" {
	type 			= list(string)
}


#########################################
#              Extra Tags               #
#########################################

variable "tags" {
	default 		= {}
	type 			= map(string)
}