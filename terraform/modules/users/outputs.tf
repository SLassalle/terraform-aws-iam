output "user_names" {
  description = "Liste des utilisateurs IAM créés"
  value       = keys(aws_iam_user.users)
}

output "user_arns" {
  description = "Liste des utilisateurs IAM et leurs ARN"
  value       = { for u in aws_iam_user.users : u.name => u.arn }
}