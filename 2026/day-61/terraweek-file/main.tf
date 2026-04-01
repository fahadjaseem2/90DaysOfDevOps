terraform {
	required_providers {
		aws = {
			source  = "hashicorp/aws"
			version = "~> 5.0"
    		}
  	}
}

provider "aws" {
	 region = "us-west-2"
}

# s3 bucket creation
resource aws_s3_bucket my_bucket1 {
	bucket = "test-bucket-for-jost-batch-10"
}

# ec2 

resource "aws_instance" "example" {
  ami           = "ami-0d76b909de1a0595d"
  instance_type = "t3.micro"

  tags = {
    Name = "TerraWeek-Day1"
  }
}