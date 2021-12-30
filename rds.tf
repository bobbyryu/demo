# CREATE RDS SECURITY GROUP

resource "aws_security_group" "my_db_sg" {
  name = "RDS Security Group"
  vpc_id = aws_vpc.my_vpc.id
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [
      aws_security_group.my_asg_sg_1.id
    ]
  }
  tags = {
    Name        = "RDS Security Group"
    Terraform   = "true"
  }
}

# Create Database Subnet Group

resource "aws_db_subnet_group" "my-db-subnet" {
  name = "rds db subnet group"
  subnet_ids = [
    aws_subnet.my-private-1.id,
    aws_subnet.my-private-2.id
    ]

  tags = {
    Name        = "RDS DB Subnet Group"
    Terraform   = "true"
  }
}

# Create RDS Database Instance 

resource "aws_db_instance" "my-db" {
  allocated_storage       = "10"
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.7"
  multi_az                = "true"
  instance_class          = "db.t2.micro"
  name                    = "magento"
  username                = "admin"
  password                = var.db-master-password
  identifier              = "my-database"
  skip_final_snapshot     = "true"
  backup_retention_period = "7"
  port                    = "3306"
  storage_encrypted       = "false"
  db_subnet_group_name    = aws_db_subnet_group.my-db-subnet.name
  vpc_security_group_ids  = [aws_security_group.my_db_sg.id]
   tags = {
    Name        = "RDS Database"
    Terraform   = "true"
  }
}