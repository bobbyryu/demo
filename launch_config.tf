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