#!/usr/bin/env bash
set -e

echo "Setting up Hyprland dotfiles..."

CONFIG_TARGET="$HOME/.config/hypr"
DOTFILES_REPO="https://github.com/hyprland/hyprland-dotfiles.git"
TMP_DIR="$(mktemp -d)"

mkdir -p "$CONFIG_TARGET"

# Téléchargement temporaire
echo "Cloning hyprland-dotfiles..."
git clone "$DOTFILES_REPO" "$TMP_DIR"

# Vérifier si le dossier cible contient déjà des fichiers
if [ -d "$CONFIG_TARGET" ] && [ "$(ls -A "$CONFIG_TARGET")" ]; then
    echo "Existing Hyprland config detected."
    echo "Skipping copy to avoid overwriting."
    echo "If you want to update dotfiles, remove $CONFIG_TARGET first."
else
    cp -r "$TMP_DIR/"* "$CONFIG_TARGET/"
    echo "Dotfiles installed successfully."
fi

# Nettoyage
rm -rf "$TMP_DIR"
