# Create Security Group for ASG

resource "aws_security_group" "my_asg_sg_1" {
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
    Name      = "My ASG Security Group"
    Terraform = "true"
  }
}

# Create Launch Configuration



# Create My FrontEnd ASG # desired number of instances is 6

resource "aws_autoscaling_group" "my_front_end" {
  name              = "My FrontEnd ASG"
  launch_template {
    id = aws_launch_template.gogreen.id
    version = "$Latest" 
  }
  health_check_type = "ELB"
  min_size          = 2
  max_size          = 2
  desired_capacity  = 2

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
  name              = "My BackEnd ASG"
    launch_template {
    id = aws_launch_template.gogreen.id
    version = "$Latest" 
  }
  health_check_type = "ELB"
  min_size          = 2
  max_size          = 2
  desired_capacity  = 2

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

resource "aws_autoscaling_attachment" "gogreen_web_asg" {
  alb_target_group_arn   = aws_lb_target_group.my-front-end-tg.arn
  autoscaling_group_name = aws_autoscaling_group.my_front_end.id
}