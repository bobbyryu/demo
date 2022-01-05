resource "aws_autoscaling_policy" "back-end-policy-up" {
  name                   = "gogreen-back-end-policy-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.my_back_end.name
}

resource "aws_cloudwatch_metric_alarm" "cpu-up-alarm2" {
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
    "AutoScalingGroupName" = aws_autoscaling_group.my_back_end.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.back-end-policy.arn]
}


resource "aws_autoscaling_policy" "back-end-policy" {
  name                   = "gogreen-back-end-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.my_back_end.name
}

resource "aws_cloudwatch_metric_alarm" "cpu-down-alarm2" {
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
    "AutoScalingGroupName" = aws_autoscaling_group.my_back_end.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.back-end-policy.arn]
}




