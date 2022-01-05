# Create and Attach internet gateway

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name      = "my-igw"
    Terraform = "true"
  }
}