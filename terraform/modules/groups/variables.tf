variable "group_names" {
  description = "Liste des groupes IAM à créer"
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