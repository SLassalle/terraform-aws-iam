# 🔹 Groupes IAM pour `prod` (sans préfixe)
group_names = {
  "Developers" = "Groupe des développeurs"
  "DevOps"     = "Groupe des DevOps"
  "Admins"     = "Groupe des administrateurs"
  "Interns"     = "Groupe des stagiaires"
}

# 🔹 Utilisateurs IAM et leurs groupes associés en `prod`
users = {
  "client.admin"    = "Admins"
  "client.support"  = "Support"
  "client.intern"  = "Interns"
}

# 🔹 Permissions IAM en `prod` (Accès total pour `Admins`, mais accès contrôlé pour `Developers` et `DevOps`)
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
        Action   = ["ec2:*", "eks:*"]
        Resource = ["*"]
      }
    ]
  }
  "Admins" = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["iam:*", "s3:*", "ec2:*", "eks:*"]
        Resource = ["*"]
      }
    ]
  }
}

s3_bucket        = "devops-project-sla-terraform-state"
dynamodb_table   = "terraform-locks-iam"
env_prefix       = ""