# Create Frontend Target Group

resource "aws_lb_target_group" "my-front-end-tg" {
  port     = 80
  protocol = "HTTP"
  name     = "my-front-end-target-group"
  vpc_id   = aws_vpc.my_vpc.id
  stickiness {
    type    = "lb_cookie"
    enabled = true
  }
  health_check {
    protocol            = "HTTP"
    path                = "/healthy.html"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
  }
  tags = {
    Name      = "My Front End Target Group"
    Terraform = "True"
  }
}

# Create Backend Target Group


resource "aws_lb_target_group" "my-back-end-tg" {
  port     = 80
  protocol = "HTTP"
  name     = "my-back-end-target-group"
  vpc_id   = aws_vpc.my_vpc.id
  stickiness {
    type    = "lb_cookie"
    enabled = true
  }
  health_check {
    protocol            = "HTTP"
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
  }
  tags = {
    Name      = "My Back End Target Group"
    Terraform = "True"
  }
}