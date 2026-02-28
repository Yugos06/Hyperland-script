#!/usr/bin/env bash
set -euo pipefail

echo "Installing Hyprland packages..."

PACKAGES=(
    hyprland
    waybar
    kitty
    wofi
    hyprpaper
    swaync
    grim
    slurp
    wl-clipboard
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    pipewire
    wireplumber
    pavucontrol
    network-manager-applet
    polkit-gnome
    thunar
    thunar-volman
    gvfs
    brightnessctl
    playerctl
)

# Remove duplicates while preserving order.
mapfile -t UNIQUE_PACKAGES < <(printf '%s\n' "${PACKAGES[@]}" | awk '!seen[$0]++')

if [ "$EUID" -eq 0 ]; then
    PACMAN_CMD=(pacman)
else
    PACMAN_CMD=(sudo pacman)
fi

"${PACMAN_CMD[@]}" -Syu --needed --noconfirm "${UNIQUE_PACKAGES[@]}"

echo "Packages installed successfully."
