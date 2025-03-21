module "iam_groups" {
  source         = "./modules/groups"
  group_names    = var.group_names
  group_policies = var.group_policies
  env_prefix     = var.env_prefix
}

module "iam_users" {
  source     = "./modules/users"
  users      = var.users
  env_prefix = var.env_prefix
}

# resource "null_resource" "prevent_destroy_in_prod" {
#   count = local.environment == "prod" ? 1 : 0

#   provisioner "local-exec" {
#     command = "echo 'ERREUR : Terraform destroy est interdit en prod !'"
#   }

#   lifecycle {
#     prevent_destroy = true
#   }
# }