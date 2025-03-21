variable "users" {
  description = "Utilisateurs IAM et leurs groupes associés"
  type        = map(string)
}

variable "env_prefix" {
  description = "Préfixe d'environnement (vide pour prod, 'dev-' ou 'staging-')"
  type        = string
}