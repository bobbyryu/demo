# Create a public route table for Public Subnets

resource "aws_route_table" "my-public-rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }
  tags = {
    Name      = "my public route table"
    Terraform = "true"
  }
}

# Attach a public route table to Public Subnets

resource "aws_route_table_association" "my-public-1-association" {
  subnet_id      = aws_subnet.my-public-1.id
  route_table_id = aws_route_table.my-public-rt.id
}

resource "aws_route_table_association" "my-public-2-association" {
  subnet_id      = aws_subnet.my-public-2.id
  route_table_id = aws_route_table.my-public-rt.id
}