# CREATE ELASTIC IP ADDRESS FOR EACH NAT GATEWAY

resource "aws_eip" "my-nat1" {
}
resource "aws_eip" "my-nat2" {
}


# CREATE NAT GATEWAY in US-West-1B

resource "aws_nat_gateway" "my-nat-gateway-1" {
  allocation_id = aws_eip.my-nat1.id
  subnet_id     = aws_subnet.my-public-1.id

  tags = {
    Name      = "Nat Gateway 1"
    Terraform = "True"
  }
}

# CREATE NAT GATEWAY in US-West-1C

resource "aws_nat_gateway" "my-nat-gateway-2" {
  allocation_id = aws_eip.my-nat2.id
  subnet_id     = aws_subnet.my-public-2.id

  tags = {
    Name      = "Nat Gateway 2"
    Terraform = "True"
  }
}