#!/usr/bin/env bash
set -euo pipefail

usage() {
    cat <<'EOF'
Usage: ./install.sh [options]

Options:
  -y, --yes             Skip dotfiles confirmation prompt
      --skip-dotfiles   Do not clone/install external dotfiles
      --skip-caelestia  Do not install/apply Caelestia shell
  -h, --help            Show this help message
EOF
}

ASSUME_YES=0
SKIP_DOTFILES=0
SKIP_CAELESTIA=0

while [ "$#" -gt 0 ]; do
    case "$1" in
        -y|--yes)
            ASSUME_YES=1
            ;;
        --skip-dotfiles)
            SKIP_DOTFILES=1
            ;;
        --skip-caelestia)
            SKIP_CAELESTIA=1
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
    shift
done

echo "Hyprland Script - installation starting"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d "$SCRIPT_DIR/scripts" ]; then
    echo "Error: scripts directory is missing."
    exit 1
fi

if [ "$ASSUME_YES" -eq 1 ]; then
    export HYPRLAND_SCRIPT_ASSUME_YES=1
fi

if [ "$SKIP_DOTFILES" -eq 1 ]; then
    export HYPRLAND_SCRIPT_SKIP_DOTFILES=1
fi

if [ "$SKIP_CAELESTIA" -eq 1 ]; then
    export HYPRLAND_SCRIPT_SKIP_CAELESTIA=1
fi

echo "Checking dependencies..."
bash "$SCRIPT_DIR/scripts/check-deps.sh"

echo "Installing packages..."
bash "$SCRIPT_DIR/scripts/install-packages.sh"
echo "Packages installed."

if [ "${HYPRLAND_SCRIPT_SKIP_DOTFILES:-0}" -eq 1 ]; then
    echo "Skipping dotfiles setup (--skip-dotfiles)."
else
    bash "$SCRIPT_DIR/scripts/setup-dotfiles.sh"
fi

HYPR_CONFIG_DIR="$SCRIPT_DIR/config/hypr"
TARGET_CONFIG_DIR="$HOME/.config/hypr"

if [ -d "$HYPR_CONFIG_DIR" ]; then
    mkdir -p "$TARGET_CONFIG_DIR"
    if find "$HYPR_CONFIG_DIR" -mindepth 1 -maxdepth 1 -print -quit | grep -q .; then
        echo "Setting up local Hyprland configuration..."
        cp -r "$HYPR_CONFIG_DIR"/. "$TARGET_CONFIG_DIR"/
        echo "Local Hyprland configuration installed."
    else
        echo "Local config/hypr exists but is empty. Skipping copy."
    fi
else
    echo "No local config/hypr folder found. Skipping local config copy."
fi

bash "$SCRIPT_DIR/scripts/setup-caelestia.sh"

echo "Hyprland installation finished successfully."
