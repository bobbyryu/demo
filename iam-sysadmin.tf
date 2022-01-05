# Definition of SysAdmin Users and SysAdmin Group

resource "aws_iam_user" "sysadmin1" {
  name = "sysadmin1"
}

resource "aws_iam_user" "sysadmin2" {
  name = "sysadmin2"
}

resource "aws_iam_group" "sysadmin_group" {
  name = "sysadmin_group"
}

# Assign SysAdmin Users to SysAdmin Group

resource "aws_iam_group_membership" "sysadmin_group" {
  name = "sysadmin_group"
  users = [
    aws_iam_user.sysadmin1.name,
    aws_iam_user.sysadmin2.name
  ]
  group = aws_iam_group.sysadmin_group.name
}

# Attach policy to the SysAdmin Group

resource "aws_iam_policy_attachment" "sysadmin_group_attachment" {
  name       = "sysadmin_group_attachment"
  groups     = [aws_iam_group.sysadmin_group.name]
  policy_arn = "arn:aws:iam::aws:policy/job-function/SystemAdministrator"
}