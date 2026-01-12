#!/usr/bin/env bash
set -e

echo "Hyprland Script - Installation starting"

# Définir le dossier du dépôt
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- 1️ Vérifier les dépendances ---
echo "Checking dependencies..."
bash "$SCRIPT_DIR/scripts/check-deps.sh"
echo "All dependencies are satisfied."

# --- 2️ Installer les paquets ---
echo "Installing packages..."
bash "$SCRIPT_DIR/scripts/install-packages.sh"
echo "Packages installed."

# --- 3️ Installer les dotfiles (optionnel) ---
bash "$SCRIPT_DIR/scripts/setup-dotfiles.sh"

# --- 4️ Installer les configs locales ---
bash "$SCRIPT_DIR/scripts/setup-hypr-config.sh"

echo "Hyprland installation finished successfully!"
