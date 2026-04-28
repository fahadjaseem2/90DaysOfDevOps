# instance outputs
output "instance_id" {
	value 		= aws_instance.module_instance.id
}

output "public_ip" {
	value 		= aws_instance.module_instance.public_ip 
}

output "private_ip" {
	value 		= aws_instance.module_instance.private_ip  
}
