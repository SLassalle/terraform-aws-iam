output "group_arns" {
  description = "Liste des groupes IAM et leurs ARN"
  value       = { for g in aws_iam_group.groups : g.name => g.arn }
}

output "policy_arns" {
  description = "Liste des policies IAM créées et leurs ARN"
  value       = { for p in aws_iam_policy.group_policies : p.name => p.arn }
}