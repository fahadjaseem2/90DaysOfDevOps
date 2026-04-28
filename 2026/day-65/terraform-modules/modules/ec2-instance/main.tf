# Instance config
resource "aws_instance" "module_instance" {
  ami                 = "ami-0cc96c4cd98401dae"
  instance_type       = var.instance_type

  subnet_id           = var.subnet_id
  vpc_security_group_ids  = var.security_group_ids 

  tags = merge (
    {
    Name = var.instance_name
  },
    var.tags
  )
}