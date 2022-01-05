data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel*"]
  }
}

resource "aws_launch_template" "gogreen" {
  name                 = "gogreen"
  image_id             = data.aws_ami.app_ami.id
  instance_type        = var.instance_type
  iam_instance_profile {
      name = aws_iam_instance_profile.ec2_s3_profile.name
      }
  vpc_security_group_ids = [aws_security_group.my_asg_sg_1.id]
  user_data            = filebase64("user-data.txt")

}