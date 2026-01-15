#!/usr/bin/env bash
set -e

echo "Hyprland Script - Installation starting"


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


echo "Checking dependencies..."
bash "$SCRIPT_DIR/scripts/check-deps.sh"
echo "All dependencies are satisfied."


echo "Installing packages..."
bash "$SCRIPT_DIR/scripts/install-packages.sh"
echo "Packages installed."


bash "$SCRIPT_DIR/scripts/setup-dotfiles.sh"


HYPR_CONFIG_DIR="$SCRIPT_DIR/config/hypr"
if [ -d "$HYPR_CONFIG_DIR" ]; then
    echo "Setting up Hyprland configuration..."
    cp -r "$HYPR_CONFIG_DIR/"* "$HOME/.config/hypr/"
    echo "Hyprland configuration installed."
else
    echo "No local config/hypr folder found. Skipping setup-hypr-config.sh."
fi

echo "Hyprland installation finished successfully!"
