variable "aws_region" {
  description = "Région AWS utilisée pour le déploiement"
  type        = string
  default     = "eu-west-3"
}

variable "s3_bucket" {
  description = "Nom du bucket S3 pour stocker l'état Terraform"
  type        = string
}

variable "dynamodb_table" {
  description = "Nom de la table DynamoDB pour le verrouillage Terraform"
  type        = string
}

variable "group_names" {
  description = "Liste des groupes IAM à créer"
  type        = map(string)
}

variable "users" {
  description = "Utilisateurs IAM et leurs groupes associés"
  type        = map(string)
}

variable "group_policies" {
  description = "Liste des policies IAM associées aux groupes"
  type = map(object({
    Version = string
    Statement = list(object({
      Effect   = string
      Action   = list(string)
      Resource = list(string)
    }))
  }))
}

variable "env_prefix" {
  description = "Préfixe d'environnement (vide pour prod, 'dev-' ou 'staging-')"
  type        = string
}