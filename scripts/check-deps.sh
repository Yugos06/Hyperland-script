#!/usr/bin/env bash
set -euo pipefail

echo "Checking dependencies..."

if [ ! -f /etc/arch-release ]; then
    echo "This installer targets Arch Linux or Arch-based distros."
    exit 1
fi

missing=()
deps=("git" "pacman")

for dep in "${deps[@]}"; do
    if ! command -v "$dep" > /dev/null 2>&1; then
        missing+=("$dep")
    fi
done

if [ "$EUID" -ne 0 ] && ! command -v sudo > /dev/null 2>&1; then
    missing+=("sudo")
fi

if [ "${#missing[@]}" -gt 0 ]; then
    echo "Missing dependencies: ${missing[*]}"
    echo "Please install them and rerun install.sh."
    exit 1
fi

echo "All dependencies are satisfied."
