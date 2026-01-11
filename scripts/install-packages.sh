#!/usr/bin/env bash
set -e

echo "Installing Hyprland packages..."

# Vérifier si on est sur un ISO live minimal
if [ ! -f /etc/os-release ]; then
    echo "Warning: Cannot detect OS version. Assuming minimal ISO."
    ISO_SAFE=true
else
    ISO_SAFE=false
fi

if [ "$ISO_SAFE" = true ]; then
    echo "ISO live detected: installing safe minimal packages..."
    PACKAGES=(
        git
        sudo
        base-devel
        less
    )
else
    echo "Full Arch installation detected: installing Hyprland packages..."
    PACKAGES=(
        hyprland
        waybar
        kitty
        wofi
        grim
        slurp
        wl-clipboard
        xdg-desktop-portal-hyprland
    )
fi

# Installer les paquets
sudo pacman -Syu --needed --noconfirm "${PACKAGES[@]}"

echo "Packages installed successfully."
