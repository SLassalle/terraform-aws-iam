#!/bin/bash

set -e

ENV=$1

if [[ -z "$ENV" ]]; then
  echo "❌ Veuillez préciser un environnement (dev, staging, prod)"
  echo "👉 Exemple : ./init.sh dev"
  exit 1
fi

BACKEND_FILE="backend-$ENV.config"

if [[ ! -f "$BACKEND_FILE" ]]; then
  echo "❌ Fichier $BACKEND_FILE introuvable."
  echo "🛠️ Assurez-vous que le fichier existe dans le dossier courant."
  exit 1
fi

echo "🧹 Nettoyage des fichiers Terraform précédents..."
rm -rf .terraform

echo "⚙️ Initialisation de Terraform pour l’environnement '$ENV' avec $BACKEND_FILE"
terraform init -reconfigure -backend-config="$BACKEND_FILE"