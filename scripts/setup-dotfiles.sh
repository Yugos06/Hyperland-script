#!/usr/bin/env bash
set -euo pipefail

echo "Setting up Hyprland dotfiles..."

if [ "${HYPRLAND_SCRIPT_SKIP_DOTFILES:-0}" -eq 1 ]; then
    echo "Dotfiles setup skipped by option."
    exit 0
fi

CONFIG_TARGET="$HOME/.config/hypr"
DOTFILES_REPO="https://github.com/prasanthrangan/hyprdots.git"
ASSUME_YES="${HYPRLAND_SCRIPT_ASSUME_YES:-0}"

if [ "$ASSUME_YES" -ne 1 ]; then
    read -rp "Install Hyprland dotfiles? (y/N): " choice
    if [[ ! "$choice" =~ ^[Yy]$ ]]; then
        echo "Skipping dotfiles installation."
        exit 0
    fi
else
    echo "Auto-confirm enabled, installing dotfiles."
fi

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Cloning dotfiles..."
git clone --depth 1 "$DOTFILES_REPO" "$TMP_DIR"

mkdir -p "$CONFIG_TARGET"

if find "$CONFIG_TARGET" -mindepth 1 -maxdepth 1 -print -quit | grep -q .; then
    echo "Existing Hyprland config detected. Skipping copy."
    exit 0
fi

SOURCE_DIR=""
if [ -d "$TMP_DIR/config/hypr" ]; then
    SOURCE_DIR="$TMP_DIR/config/hypr"
elif [ -d "$TMP_DIR/hypr" ]; then
    SOURCE_DIR="$TMP_DIR/hypr"
else
    SOURCE_DIR="$TMP_DIR"
fi

cp -r "$SOURCE_DIR"/. "$CONFIG_TARGET"/
echo "Dotfiles installed successfully."
