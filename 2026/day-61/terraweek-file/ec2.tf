# region 
# we create region on s3.tf file so we dont need to write provider  

provider "aws" {
	region = "us-west-2"
}

# key value pair

resource aws_key_pair my_key_pair {
	key_name = "terra-automate-key"
	public_key = file("terra-ec2-key.pub")
}


# VPC Default

resource aws_default_vpc default {}

# Security group 

resource aws_security_group my_security_group {
	name = "terra-security-group"
	vpc_id = aws_default_vpc.default.id  # interpolation 
	description = "this is optional"
}

# inbound and outbound rule	

resource aws_vpc_security_group_ingress_rule allow_http {
	security_group_id = aws_security_group.my_security_group.id
	cidr_ipv4 = aws_default_vpc.default.cidr_block
	from_port = 80
	ip_protocol = "tcp"
	to_port = 80
}

resource aws_vpc_security_group_ingress_rule allow_ssh {
        security_group_id = aws_security_group.my_security_group.id
        cidr_ipv4 = "0.0.0.0/0"
        from_port = 22
        ip_protocol = "tcp"
        to_port = 22
}

resource aws_vpc_security_group_egress_rule allow_all_traffic {
	security_group_id = aws_security_group.my_security_group.id
	cidr_ipv4 = "0.0.0.0/0"
	ip_protocol = "-1"   # all port

}

# instance EC2

resource aws_instance my_instance {

	ami = "ami-0d76b909de1a0595d" # OS

	instance_type = "t3.micro" # instance type
	
	key_name = aws_key_pair.my_key_pair.key_name # key pair

	vpc_security_group_ids = [aws_security_group.my_security_group.id] #VPC and Security Group

	root_block_device {
		volume_size = 10
		volume_type = "gp3" # gp3 means genarals purpose
	} # root storage
	tags = {
		Name = "terra-auto-instance"
	}
}
