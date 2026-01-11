#!/usr/bin/env bash
set -e

echo "Hyprland Script - Installation starting"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/scripts/check-deps.sh"
source "$SCRIPT_DIR/scripts/install-packages.sh"
source "$SCRIPT_DIR/scripts/setup-hypr-config.sh"

echo "Installation finished successfully"
