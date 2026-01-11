#!/usr/bin/env bash
set -e

echo "Hyprland Script - Installation starting"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1️ Vérification des dépendances
source "$SCRIPT_DIR/scripts/check-deps.sh"

# 2️ Installation des paquets Hyprland
source "$SCRIPT_DIR/scripts/install-packages.sh"

# 3️ Installation des dotfiles Hyprland
source "$SCRIPT_DIR/scripts/setup-dotfiles.sh"

echo "Installation finished successfully"

