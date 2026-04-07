# vpc_id
output "vpc_id" {
	description = "aws vpc id"
	value = aws_vpc.main.id
}

#subnet
output "subnet_id" {
	description = "subnet id from main.tf"
	value = aws_subnet.main.id
}

# instance id
output "instance_id" {
	description = " indtance detail"
	value = aws_instance.new_instance.id
}

# instance public ip

output "instance_public_ip" {
	value = aws_instance.new_instance.public_ip
}

# instance_public_dns

output "instance_public_dns" {
	value = aws_instance.new_instance.public_dns
} 

# security_group_id
output "security_group_id" {
	value = aws_security_group.Terra_SG.id
}