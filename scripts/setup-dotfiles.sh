#!/usr/bin/env bash
set -e

echo "Setting up Hyprland dotfiles..."

CONFIG_TARGET="$HOME/.config/hypr"

read -rp "Install Hyprland dotfiles? (y/N): " choice
if [[ ! "$choice" =~ ^[Yy]$ ]]; then
    echo "Skipping dotfiles installation."
    exit 0
fi

TMP_DIR="$(mktemp -d)"

# Repo valide
DOTFILES_REPO="https://github.com/prasanthrangan/hyprdots.git"

echo "Cloning dotfiles..."
git clone "$DOTFILES_REPO" "$TMP_DIR"

mkdir -p "$CONFIG_TARGET"

if [ -d "$CONFIG_TARGET" ] && [ "$(ls -A "$CONFIG_TARGET")" ]; then
    echo "Existing Hyprland config detected. Skipping copy."
else
    # hyprdots a une structure particulière
    if [ -d "$TMP_DIR/config/hypr" ]; then
        cp -r "$TMP_DIR/config/hypr/"* "$CONFIG_TARGET/"
    else
        cp -r "$TMP_DIR/"* "$CONFIG_TARGET/"
    fi
    echo "Dotfiles installed successfully."
fi

rm -rf "$TMP_DIR"
