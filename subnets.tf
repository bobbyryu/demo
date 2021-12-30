# Create Public Subnets

resource "aws_subnet" "my-public-1" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name        = "my public subnet 1"
    Terraform   = "True"
  }
}
resource "aws_subnet" "my-public-2" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-west-1c"
  map_public_ip_on_launch = "true"
  tags = {
    Name        = "my public subnet 2"
    Terraform   = "True"
  }
}

# Create Private Subnets

resource "aws_subnet" "my-private-1" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-1b"
  map_public_ip_on_launch = "false"
  tags = {
    Name        = "my private subnet 1"
    Terraform   = "True"
  }
}

resource "aws_subnet" "my-private-2" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "us-west-1c"
  map_public_ip_on_launch = "false"
  tags = {
    Name        = "my private subnet 2"
    Terraform   = "True"
  }
}

