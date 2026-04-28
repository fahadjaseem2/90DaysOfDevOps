locals {
  common_tags = {
    Project = "terraweek"
    Env     = "dev"
  }
}


resource "aws_vpc" "main_vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = merge (local.common_tags, {
    Name = "main_vpc"
  })
}

resource "aws_subnet" "main_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2b"


  tags = merge (local.common_tags, {
    Name = "Main_subent"
  })
}

resource "aws_internet_gateway" "main_gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = merge (local.common_tags, {
    Name = "main_gw"
  })
}


resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_gw.id
  }
}


resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.main_subnet.id
  route_table_id = aws_route_table.main_rt.id
}



# calling security group module
module "web_sg" {
    source          = "./modules/security-group"
    vpc_id          = aws_vpc.main_vpc.id
    sg_name         = "terraweek-web-sg"
    ingress_ports   = [22, 80, 443]
    tags            = local.common_tags 
}

module "web-server" {
    source                      = "./modules/ec2-instance"
    ami_id                      = data.aws_ami.amazon_linux.id
    instance_type               = "t2.micro"
    subnet_id                   = aws_subnet.main_subnet.id 
    security_group_ids          = [module.web_sg.sg_id]     # sg_id = output
    instance_name               = "terraweek-web"
    tags                        = local.common_tags 
}

module "api-server" {
    source                      = "./modules/ec2-instance"
    ami_id                      = data.aws_ami.amazon_linux.id
    instance_type               = "t2.micro"
    subnet_id                   = aws_subnet.main_subnet.id 
    security_group_ids          = [module.web_sg.sg_id]
    instance_name              = "tarraweek-api"
    tags                        = local.common_tags 
}

