resource "aws_autoscaling_policy" "front-end-policy-up" {
  name                   = "gogreen-front-end-policy-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.my_front_end.name
}

resource "aws_cloudwatch_metric_alarm" "cpu-up-alarm" {
  alarm_name                = "gogreen-cpu-up-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "75"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.my_front_end.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.front-end-policy.arn]
}


resource "aws_autoscaling_policy" "front-end-policy" {
  name                   = "gogreen-front-end-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.my_front_end.name
}

resource "aws_cloudwatch_metric_alarm" "cpu-down-alarm" {
  alarm_name                = "gogreen-cpu-down-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "30"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.my_front_end.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.front-end-policy.arn]
}




