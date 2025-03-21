# 🔹 Groupes IAM pour `dev`
group_names = {
  "Developers" = "Groupe des développeurs"
  "DevOps"     = "Groupe des DevOps"
}

# 🔹 Utilisateurs IAM et leurs groupes associés en `dev`
users = {
  "john.doe"    = "Developers"
  "jane.devops" = "DevOps"
}

# 🔹 Permissions IAM par groupe en `dev`
group_policies = {
  "Developers" = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket", "logs:ReadLogEvents"]
        Resource = ["*"]
      }
    ]
  }
  "DevOps" = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ec2:DescribeInstances", "eks:DescribeCluster"]
        Resource = ["*"]
      }
    ]
  }
}

s3_bucket        = "devops-project-sla-terraform-state"
dynamodb_table   = "terraform-locks-iam"
env_prefix       = "dev-"