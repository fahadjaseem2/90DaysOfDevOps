# Security Group
resource "aws_security_group" "allow_tls" {
  name                      = var.sg_name
  description               = "dynamic security Group"
  vpc_id                    = var.vpc_id

# dynamics ingress rule
  dynamic "ingress" {
    for_each  = var.ingress_ports
    content {
        description         = "Allow ports ${ingress.value}"
        from_port           = ingress.value
        to_port             = ingress.value
        protocol            = "tcp"
        cidr_blocks         = [ "0.0.0.0/0" ]

#       cidr_blocks         = ingress.value == 22    (ternary condition check if my port is 22 
#           ? ["your IP/32"]                          then change cidr_blocks value for port 22
#           : ["0.0.0.0/0"]                            and rest ports are open to all )
    }
  }

#resource "aws_vpc_security_group_ingress_rule" "allow_ssh_and_HTTP" {
# for_each          = toset(var.ingress_ports)

#  security_group_id = aws_security_group.allow_tls.id
#  cidr_ipv4         = aws_vpc.main.cidr_block

#  from_port         = each.value
#  ip_protocol       = "tcp"
#  to_port           = each.value
#}

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # all protocol, when protocol is -1, ports are ignored
    cidr_blocks      = ["0.0.0.0/0"] 
  }


  tags = merge (
    {
    Name = var.sg_name
  },
    var.tags
  )
}