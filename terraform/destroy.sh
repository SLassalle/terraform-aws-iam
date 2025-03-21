#!/bin/bash

set -e

ENV=$1

if [[ -z "$ENV" ]]; then
  echo "❌ Spécifie un environnement à détruire : ./destroy.sh [dev|staging]"
  exit 1
fi

if [[ "$ENV" == "prod" ]]; then
  echo "🚫 Destruction de la production interdite."
  echo "🔒 Ce projet bloque tout `terraform destroy` en prod."
  exit 1
fi

TFVARS="envs/$ENV/terraform.tfvars"

if [[ ! -f "$TFVARS" ]]; then
  echo "❌ Fichier $TFVARS introuvable pour l'environnement '$ENV'."
  exit 1
fi

echo "⚠️ Vous allez supprimer toutes les ressources Terraform de l’environnement '$ENV'"
read -p "❗️ Confirmez en tapant OUI : " CONFIRM

if [[ "$CONFIRM" != "OUI" ]]; then
  echo "❌ Destruction annulée."
  exit 1
fi

echo "📦 Initialisation de Terraform pour $ENV..."
./init.sh "$ENV"

echo "🧹 Destruction en cours..."
terraform destroy -var-file="$TFVARS" -auto-approve