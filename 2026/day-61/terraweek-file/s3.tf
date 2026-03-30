#providor block
#provider "aws" {
#       region = "us-west-2"
#}

# resource block
resource aws_s3_bucket my_bucket {

        bucket = "local-bucket-josh-batch"

}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"

  tags = {
    Name = "TerraWeek-Day1"
  }
}
