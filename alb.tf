# Create Application Load Balancer Security Group #1

resource "aws_security_group" "my_alb_sg_1" {
  vpc_id = aws_vpc.my_vpc.id
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name      = "ALB Security Group 1"
    Terraform = "True"
  }
}

# Create Application Load Balancer (Public Subnets)

resource "aws_lb" "my_alb_1" {
  name               = "my-app-load-balancer-1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_alb_sg_1.id]
  subnets = [
    aws_subnet.my-public-1.id,
    aws_subnet.my-public-2.id,
  ]
  enable_deletion_protection = false
  tags = {
    Name      = "my alb-1"
    Terraform = "True"
  }
}

# Create Application Load Balancer Security Group #2

resource "aws_security_group" "my_alb_sg_2" {
  vpc_id = aws_vpc.my_vpc.id
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  tags = {
    Name      = "ALB Security Group 2"
    Terraform = "True"
  }
}

# Create Application Load Balancer (Private Subnets)

resource "aws_lb" "my_alb_2" {
  name               = "my-app-load-balancer-2"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_alb_sg_2.id]
  subnets = [
    aws_subnet.my-private-1.id,
    aws_subnet.my-private-2.id,
  ]
  enable_deletion_protection = false
  tags = {
    Name      = "my alb-2"
    Terraform = "True"
  }
}