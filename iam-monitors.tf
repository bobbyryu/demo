# Definition of Monitoring Users and Monitoring Group

resource "aws_iam_user" "monitoruser_1" {
    name = "monitoruser_1"
}

resource "aws_iam_user" "monitoruser_2" {
    name = "monitoruser_2"
}

resource "aws_iam_user" "monitoruser_3" {
    name = "monitoruser_3"
}

resource "aws_iam_user" "monitoruser_4" {
    name = "monitoruser_4"
}

resource "aws_iam_group" "monitoring_group" {
    name = "monitoring_group"
}

# Assign Monitor Users to Monitoring Group

resource "aws_iam_group_membership" "monitoring_group" {
    name = "monitoring_group"
    users = [
        aws_iam_user.monitoruser_1.name,
        aws_iam_user.monitoruser_2.name,
        aws_iam_user.monitoruser_3.name,
        aws_iam_user.monitoruser_4.name
    ]
    group = aws_iam_group.monitoring_group.name
}

# Attach policy to the Monitoring Group

# this role provides read only access to Amazon EC2 via the AWS Management Console
resource "aws_iam_policy_attachment" "ec2_monitoring_group_attachment" {
    name = "ec2_monitoring_group_attachment"
    groups = [aws_iam_group.monitoring_group.name]
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

# this role provides read only access to all buckets via the AWS Management Console
resource "aws_iam_policy_attachment" "s3_monitoring_group_attachment" {
    name = "s3_monitoring_group_attachment"
    groups = [aws_iam_group.monitoring_group.name]
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

# this role provides access to Cloudwatch for RDS Enhanced Monitoring
resource "aws_iam_policy_attachment" "rds_monitoring_group_attachment" {
    name = "rds_monitoring_group_attachment"
    groups = [aws_iam_group.monitoring_group.name]
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}