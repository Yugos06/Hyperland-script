#!/usr/bin/env bash
set -e

echo "Setting up Hyprland dotfiles..."

CONFIG_TARGET="$HOME/.config/hypr"
DOTFILES_REPO="https://github.com/hyprland/hyprland-dotfiles.git"
TMP_DIR="$(mktemp -d)"

mkdir -p "$CONFIG_TARGET"
echo "Cloning hyprland-dotfiles..."
git clone "$DOTFILES_REPO" "$TMP_DIR"

if [ -d "$CONFIG_TARGET" ] && [ "$(ls -A "$CONFIG_TARGET")" ]; then
    echo "Existing Hyprland config detected. Skipping copy."
else
    cp -r "$TMP_DIR/"* "$CONFIG_TARGET/"
    echo "Dotfiles installed successfully."
fi

rm -rf "$TMP_DIR"
