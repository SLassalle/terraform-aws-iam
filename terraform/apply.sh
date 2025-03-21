#!/bin/bash

set -e

ENV=$1

if [[ -z "$ENV" ]]; then
  echo "❌ Vous devez spécifier un environnement (ex: dev)"
  echo "👉 Exemple : ./apply.sh dev"
  exit 1
fi

if [[ "$ENV" != "dev" ]]; then
  echo "🚫 Apply interdit en local pour l’environnement '$ENV'."
  echo "🔐 Utilisez la CI/CD pour staging et prod."
  exit 1
fi

TFVARS="envs/$ENV/terraform.tfvars"
BACKEND_CONFIG="backend-$ENV.config"

if [[ ! -f "$TFVARS" ]]; then
  echo "❌ Fichier $TFVARS introuvable."
  exit 1
fi

if [[ ! -f "$BACKEND_CONFIG" ]]; then
  echo "❌ Fichier $BACKEND_CONFIG introuvable."
  exit 1
fi

echo "📦 Initialisation de Terraform pour $ENV..."
terraform init -backend-config="$BACKEND_CONFIG" -reconfigure

echo "🔍 Prévisualisation du plan pour $ENV..."
terraform plan -var-file="$TFVARS"

echo "🚀 Application de la configuration Terraform pour $ENV..."
terraform apply -var-file="$TFVARS" -auto-approve