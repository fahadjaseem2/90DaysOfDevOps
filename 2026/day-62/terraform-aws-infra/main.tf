# key pair
resource aws_key_pair my_key {
key_name = "terra-day2"
public_key = file("terra-day2.pub")
}

# provider ( create earliar)


# aws vpc

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
 
  tags = {
    Name = "erraWeek-VPC"
  }
}

# aws subnet

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "TerraWeek-Public-Subnet"
  }
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
  name        = "TerraWeek-SG"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.Terra_SG.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.Terra_SG.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.Terra_SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


# aws instance
resource aws_instance new_instance {
  ami = "ami-0d76b909de1a0595d"
  instance_type = "t3.micro"
  key_name = aws_key_pair.my_key.key_name
  subnet_id = aws_subnet.main.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.Terra_SG.id]
  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "TerraWeek-Server"
  }
}

resource "aws_s3_bucket" "my_bucket2" {
  bucket = "josh-batch-10-bucket2"

  depends_on = [aws_instance.new_instance]

}