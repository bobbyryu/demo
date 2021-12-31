# Definition of DB Admin Users (2 of them) and DB Admin Group

resource "aws_iam_user" "db_admin1" {
    name = "db_admin1"
}

resource "aws_iam_user" "db_admin2" {
    name = "db_admin2"
}

resource "aws_iam_group" "dbadmin_group" {
    name = "dbadmin_group"
}

# Assign DB Admin Users to DB Admin group

resource "aws_iam_group_membership" "dbadmin_group" {
    name = "dbadmin_group"
    users = [
        aws_iam_user.db_admin1.name,
        aws_iam_user.db_admin2.name
    ]
    group = aws_iam_group.dbadmin_group.name
}

# Attach policy to the DB Admin group

resource "aws_iam_policy_attachment" "dbadmin_group_attachment" {
    name = "dbadmin_group_attachment"
    groups = [aws_iam_group.dbadmin_group.name]
    policy_arn = "arn:aws:iam::aws:policy/job-function/DatabaseAdministrator"
}
