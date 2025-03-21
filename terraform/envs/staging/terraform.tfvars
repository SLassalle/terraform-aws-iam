# 🔹 Groupes IAM pour `staging` (préfixés "staging-")
group_names = {
  "Developers" = "Groupe des développeurs"
  "DevOps"     = "Groupe des DevOps"
  "Admins"     = "Groupe des administrateurs"
}

# 🔹 Utilisateurs IAM et leurs groupes associés en `staging`
users = {
  "Bob.Dylan" = "DevOps"
  "Elon.Musk"  = "Admins"
  "Manu.macron"  = "Admins"
}

# 🔹 Permissions IAM en `staging` (similaire à `prod`, mais avec restrictions)
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
      },
      {
        Effect   = "Deny"
        Action   = ["eks:DeleteCluster", "ec2:TerminateInstances"]
        Resource = ["*"]
      }
    ]
  }
  "Admins" = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["iam:ListUsers", "iam:ListRoles", "iam:ListPolicies"]
        Resource = ["*"]
      },
      {
        Effect   = "Deny"
        Action   = ["iam:DeleteUser", "iam:DeleteRole"]
        Resource = ["*"]
      }
    ]
  }
}

s3_bucket        = "devops-project-sla-terraform-state"
dynamodb_table   = "terraform-locks-iam"
env_prefix       = "staging-"