# locals
locals {
	name_prefix = "${var.project_name}-${var.environment}"
	common_tags = {
		Project = var.project_name
		Environment = var.environment
		ManagedBy = "Terraform"
	}
}



# key pair
resource aws_key_pair my_key {
key_name = "terra-day2"
public_key = file("terra-day2.pub")
}

# provider ( create earliar)


# aws vpc

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
 
  tags = merge (local.common_tags, {
	Name = "${local.name_prefix}-vpc"
	},
	var.extra_tags
	)
}

# aws subnet

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = merge (local.common_tags, {
	Name = "${local.name_prefix}-subnet"
	},
	var.extra_tags)
}

# aws internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

# aws route table

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# aws route table association

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.route_table.id
}


# aws security group


resource "aws_security_group" "Terra_SG" {
  name        = "${var.project_name}-SG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = merge (
    {
        Name = "${var.project_name}-SG"
        Environment = var.environment
    },
    var.extra_tags
  )
}

resource "aws_vpc_security_group_ingress_rule" "allow_ports" {
  for_each = toset(var.allowed_ports)
# toset() converts a list → set (list allow duplicate And set dont allow dupplicate)

  security_group_id = aws_security_group.Terra_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = each.value
  ip_protocol       = "tcp"
  to_port           = each.value
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.Terra_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


# aws instance
resource aws_instance new_instance {
  ami = data.aws_ami.my_ami.id

  instance_type = var.instance_type

  key_name = aws_key_pair.my_key.key_name

  subnet_id = aws_subnet.main.id

  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.Terra_SG.id]
  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = merge (local.common_tags,
    {
    Name = "${local.name_prefix}-Server"
  },
  var.extra_tags
  )

  lifecycle {
  create_before_destroy = true
  # ignore_changes = [instance_state]
  }
}

# s3 bucket
resource "aws_s3_bucket" "my_bucket2" {
  bucket = "josh-batch-10-bucket2"

  depends_on = [aws_instance.new_instance]
  
}

resource "aws_ec2_instance_state" "instance_state" {
  instance_id = aws_instance.new_instance.id
  state       = "running"
}

#data 
data "aws_ami" "my_ami" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#data source for AZS
data "aws_availability_zones" "available" {
  state = "available"
}