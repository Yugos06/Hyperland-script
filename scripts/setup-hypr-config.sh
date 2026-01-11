#!/usr/bin/env bash
set -e

echo "Setting up Hyprland configuration..."

CONFIG_SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")/../config/hypr" && pwd)"
CONFIG_TARGET="$HOME/.config/hypr"

mkdir -p "$CONFIG_TARGET"

if [ -d "$CONFIG_TARGET" ] && [ "$(ls -A "$CONFIG_TARGET")" ]; then
    echo "Existing Hyprland configuration detected."
    echo "Skipping config copy to avoid overwriting."
    echo "You can manually copy files from config/hypr if needed."
else
    cp -r "$CONFIG_SOURCE/"* "$CONFIG_TARGET/"
    echo "Hyprland configuration installed."
fi
