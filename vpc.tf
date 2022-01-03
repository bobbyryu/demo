# Define VPC Variable



# Create VPC

resource "aws_vpc" "my_vpc" {
  cidr_block = var.aws-vpc-cidr
  instance_tenancy = "default"
  tags = {
    Name = "my_vpc"
    Terrafrom = "True"
  }
}