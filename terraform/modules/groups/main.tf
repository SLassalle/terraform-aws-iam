resource "aws_iam_group" "groups" {
  for_each = var.group_names
  name     = "${var.env_prefix}${each.key}"
}

resource "aws_iam_policy" "group_policies" {
  for_each = var.group_policies
  name     = "${var.env_prefix}${each.key}-policy"
  policy   = jsonencode(each.value)
}

resource "aws_iam_group_policy_attachment" "attach_policies" {
  for_each   = var.group_policies
  group      = aws_iam_group.groups[each.key].name
  policy_arn = aws_iam_policy.group_policies[each.key].arn
}