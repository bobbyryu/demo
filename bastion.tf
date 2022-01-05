# resource "aws_instance" "bhost" {
#   ami               = var.image_id
#   instance_type     = var.instance_type
#   count             = 1
#   subnet_id         = var.cidrs.public1
#   availability_zone = "us-west-1a"
#   security_groups   = ["${aws_security_group.bastion_sg.id}"]
  

#   tags = {
#     Name = "bastion host"
#   }
# }
# resource "aws_security_group" "bastion_sg" {
#   name        = "bastion_sg"
#   description = "Used by lc for public access to web servers"
#   vpc_id      = aws_vpc.my_vpc.id

# egress {
#     from_port = 0
#     to_port   = 0
#     protocol  = "-1"
#     cidr_blocks = [
#       "0.0.0.0/0"
#     ]
#   }
#   ingress {
#     from_port = 0
#     to_port   = 0
#     protocol  = "-1"
#     cidr_blocks = [
#       "0.0.0.0/0"
#     ]
#   }
# }