# Create ALB Listner - HTTPS

resource "aws_lb_listener" "my_https" {
  load_balancer_arn = aws_lb.my_alb_1.arn
  port              = 80
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-TLS-1-0-2015-04"
  #certificate_arn   = "arn:aws:acm:us-west-1:516523490746:certificate/5efcc24f-6e73-4433-b4f7-1880118ff33a"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-front-end-tg.arn
  }
}

# Create ALB Listner Backend Rule - HTTPS

resource "aws_lb_listener_rule" "my_admin_https" {
  listener_arn = aws_lb_listener.my_https.arn
  priority     = 100
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-back-end-tg.arn
  }
  condition {
    path_pattern {
      values = ["/admin*"]
    }
  }
}