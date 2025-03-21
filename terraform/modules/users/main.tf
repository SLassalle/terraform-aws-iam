resource "aws_iam_user" "users" {
  for_each = var.users
  name     = each.key
}

resource "aws_iam_group_membership" "user_membership" {
  for_each = var.users
  name     = "membership-${each.key}"
  users    = [aws_iam_user.users[each.key].name]
  group    = "${var.env_prefix}${each.value}"
}