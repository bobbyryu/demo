# Create Security Group for ASG

resource "aws_security_group" "my_asg_sg_1" {
  vpc_id = aws_vpc.my_vpc.id
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
 ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [
      aws_security_group.my_alb_sg_1.id
    ]
  }
  #ingress {
    #from_port   = 22
    #to_port     = 22
    #protocol    = "tcp"
    #security_groups = [
      #aws_security_group.my_bastion_sg.id ##if we want to add bastion host##
    #]
  #}
  tags = {
    Name        = "My ASG Security Group"
    Terraform   = "true"
  } 
}

# Create Launch Configuration

resource "aws_launch_configuration" "my_launch_config" {
  name_prefix   = "My Launch Configuration"
  image_id      = "ami-03af6a70ccd8cb578"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.my_asg_sg_1.id]
  #key_name = aws_key_pair.ssh-key.key_name
  lifecycle {
    create_before_destroy = true
  }
}

# Create My FrontEnd ASG # desired number of instances is 6

resource "aws_autoscaling_group" "my_front_end" {
  name                 = "My FrontEnd ASG"
  launch_configuration = aws_launch_configuration.my_launch_config.name
  health_check_type    = "ELB"
  min_size             = 6
  max_size             = 6
  desired_capacity     = 6

  vpc_zone_identifier = [
    aws_subnet.my-private-1.id,
    aws_subnet.my-private-2.id
  ]
  target_group_arns = [aws_lb_target_group.my-front-end-tg.arn]
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "My FrontEnd ASG"
    propagate_at_launch = true  
  }
}

# Create My Backend ASG # desired number of instances is 5

resource "aws_autoscaling_group" "my_back_end" {
  name                 = "My BackEnd ASG"
  launch_configuration = aws_launch_configuration.my_launch_config.name
  health_check_type    = "ELB"
  min_size             = 5
  max_size             = 5
  desired_capacity     = 5

  vpc_zone_identifier = [
    aws_subnet.my-private-1.id,
    aws_subnet.my-private-2.id
  ]
  target_group_arns = [aws_lb_target_group.my-back-end-tg.arn]
  lifecycle {
    create_before_destroy = true
  }
 tag {
    key                 = "Name"
    value               = "My BackEnd ASG"
    propagate_at_launch = true  
  }
}