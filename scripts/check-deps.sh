#!/usr/bin/env bash
set -e

echo "Checking dependencies..."
deps=("git" "sudo" "pacman")
for dep in "${deps[@]}"; do
    if ! command -v "$dep" &> /dev/null; then
        echo "Missing dependency: $dep"
        exit 1
    fi
done
echo "All dependencies are satisfied."
