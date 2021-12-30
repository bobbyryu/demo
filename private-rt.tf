# Create first private route table and associate it with private subnet in us-west-1b
 
resource "aws_route_table" "my_private_route_table_1" {
    vpc_id = aws_vpc.my_vpc.id
    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat-gateway-1.id
  }
    tags =  {
        Name      = "my private route table 1"
        Terraform = "True"
  }
}
 
resource "aws_route_table_association" "my_priv_rt_1" {
    subnet_id = aws_subnet.my-private-1.id
    route_table_id = aws_route_table.my_private_route_table_1.id
}
 
# Create second private route table and associate it with private subnet in us-west-1c 
 
resource "aws_route_table" "my_private_route_table_2" {
    vpc_id = aws_vpc.my_vpc.id
    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat-gateway-2.id
  }
    tags =  {
        Name      = "my private route table 2"
        Terraform = "True"
  }
}
 
resource "aws_route_table_association" "my_priv_rt_2" {
    subnet_id = aws_subnet.my-private-2.id
    route_table_id = aws_route_table.my_private_route_table_2.id
}
